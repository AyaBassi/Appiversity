//
//  RegistrationViewModelTests.swift
//  AppiversityTests
//
//  Created by Payam Karbassi on 26/05/2023.
//

import XCTest
@testable import Appiversity


final class RegistrationViewModelTests: XCTestCase {

    var registrationViewModel : RegistrationViewModel!
    
    override func setUpWithError() throws {
        // for
        registrationViewModel = RegistrationViewModel()
    }

    override func tearDownWithError() throws {
       registrationViewModel = nil
    }

    func testIfRegistraionViewModelIsConstructed() throws {
        // then
        XCTAssertNotNil(registrationViewModel)
    }
    
    func testForNegativeCaseOf_Email_Password_RepeatPassword_And_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "", password: "", repeatPassword: "", false)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNegativeCaseOf_Email_Password_RepeatPassword_ApartFrom_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "", password: "", repeatPassword: "", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNegativeCaseOf_Email_Password_ApartFrom_RepeatPassword_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "", password: "", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNegativeCaseOf_Email_ApartFrom_Password_RepeatPassword_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "", password: "123456", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForPositiveCaseOf_Email_Password_RepeatPassword_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "123456", repeatPassword: "123456", true)
        // then
        XCTAssertTrue(emailIsValid)
    }
    
    func testForNagativeCaseOf_Password_And_RepeatPassword_Not_Being_Same() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "123456", repeatPassword: "123457", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagativeCaseOf_Password_And_RepeatPassword_Not_Being_Same_Swapped_RelativeToPreviousTest() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "123457", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagative_Case_Of_Length_Of_Password_And_RepeatPassword_() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "12345", repeatPassword: "12345", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    
    func testForNagativeCaseOf_Password_And_RepeatPassword_And_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "", repeatPassword: "", false)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagativeCaseOf_RepeatPassword_And_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "123456", repeatPassword: "", false)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagativeCaseOf_termsAndAgreementBoxIsChecked() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmail.com", password: "123456", repeatPassword: "123456", false)
        // then
        XCTAssertFalse(emailIsValid)
    }

    func testForNagativeCaseOf_Email_At_Sign_Format() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "testgmail.com", password: "123456", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagativeCaseOf_Email_Dot_Format() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@gmailcom", password: "123456", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testForNagativeCaseOfNumberOfLettersBetween_At_And_Dot() throws {
        // when
        let emailIsValid = registrationViewModel.isValidRegistration(email: "test@.com", password: "123456", repeatPassword: "123456", true)
        // then
        XCTAssertFalse(emailIsValid)
    }
    
    func testSetColourAndImageForCheckBoxWhenCheckBoxIsTrue(){
        // when
        let (name, colour) = registrationViewModel.setColourAndImageForCheckBox(isChecked: true)
        // then
        XCTAssertEqual(name, "checkmark.square")
        XCTAssertEqual(colour, UIColor.systemMint)
    }
    
    func testSetColourAndImageForCheckBoxWhenCheckBoxIsFalse(){
        // when
        let (name, colour) = registrationViewModel.setColourAndImageForCheckBox(isChecked: false)
        // then
        XCTAssertEqual(name, "square")
        XCTAssertEqual(colour, UIColor.lightGray)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
