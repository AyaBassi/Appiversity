//
//  RegistrationViewModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 26/05/2023.
//

import UIKit
class RegistrationViewModel {

    func isValidRegistration(email:String?,password:String?,repeatPassword:String?, _ termsAndAgreementBoxIsChecked:Bool) -> Bool {
        var isValid = false
        
        guard let email = email else {return isValid}
        guard let password = password else { return isValid}
        guard let repeatPassword = repeatPassword else { return isValid}
        
        // checking for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        // checking for password validation
        let isValidPassword = password.count >= 6
        
        // checking both passwords match
        var isValidRepeatPassword = false
        password == repeatPassword ? isValidRepeatPassword = true : print("Password don't match")
        
        // making sure they are both valid
        isValid = isEmailValid && isValidPassword && isValidRepeatPassword && termsAndAgreementBoxIsChecked
        
        return isValid
    }
    
    func registerUser(withEmail email:String, password:String) async{
        do {
            let result = try await Service.shared.createUser(withEmail: email, password: password)
        }catch {
            print(error.localizedDescription)
        }
        
    }
    
    func setColourAndImageForCheckBox(isChecked:Bool) -> (systemImageName:String, colorOfCheckBox:UIColor){
        isChecked == true ? ( "checkmark.square",.systemMint) : ( "square" , .lightGray)
    }
    
    
}
