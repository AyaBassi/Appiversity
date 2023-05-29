//
//  LoginViewModelTests.swift
//  AppiversityTests
//
//  Created by Payam Karbassi on 29/05/2023.
//

import XCTest
@testable import Appiversity

final class LoginViewModelTests: XCTestCase {

    var loginViewModel : LoginViewModel!
    
    override func setUpWithError() throws {
        loginViewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        loginViewModel = nil
    }

    func testLoginViewModelExistance() throws {
        XCTAssertNotNil(loginViewModel)
    }
    
    func testLoginViewIsValidLoginWithMaxNegativeTest() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "", password: "")
        XCTAssertFalse(isValid)
    }
    
    func testLoginViewIsValidLoginWithMaxNegativeForEmailOnly() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Max_Negative_For_Password_Only() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "test@gmail.com", password: "")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Negative_Case_For_Email_Where_At_Sign_Is_Missing() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "testgmail.com", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Negative_Case_For_Email_Where_Dot_Is_Missing() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "test@gmailcom", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Almost_Negative_Case_Of_Password() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "test@gmail.com", password: "12345")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Negative_Case_Of_No_Letter_Before_At_Sign() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "@g.com", password: "123456")
        XCTAssertFalse(isValid)
    }
    func test_LoginView_IsValidLogin_With_Negative_Case_Of_No_Letter_Just_After_At_Sign() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "a@.com", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Negative_Case_Of_Only_One_Letter_After_Dot() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "a@a.c", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    func test_LoginView_IsValidLogin_With_Negative_Case_Of_Two_At_Sign() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "a@@a.co", password: "123456")
        XCTAssertFalse(isValid)
    }
    
    
    func test_LoginView_IsValidLogin_With_Bare_Minimim_Positive_Case() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "a@a.aa", password: "123456")
        XCTAssertTrue(isValid)
    }

    func test_LoginView_IsValidLogin_With_Regular_Positive_Case() throws {
        let isValid = loginViewModel.isValidLogin(withEmail: "test1@gmail.com", password: "123456789")
        XCTAssertTrue(isValid)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
