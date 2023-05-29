//
//  LoginViewModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//

import Foundation
import FirebaseAuth
import Firebase

class LoginViewModel {
        
    func isValidLogin(withEmail email:String?, password:String?) -> Bool{
        var isValid = false
        
        guard let email = email else {return isValid}
        guard let password = password else { return isValid}
        
        // checking for email validation
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailPredicate.evaluate(with: email)
        
        // checking for password validation
        let isValidPassword = password.count >= 6
        
        // making sure they are both valid
        isValid = isEmailValid && isValidPassword
        
        return isValid
    }
    
    
    func logUserIn(withEmail email: String?, password:String?, apiService: ServiceProtocol ) async -> Result<User?,NetworkError> {
        guard let email = email else { return .failure(.emptyEmailTextField)}
        guard let password = password else { return .failure(.emptyPasswordTextField)}
        do {
            let result = try await apiService.signUserIn(withEmail: email, password: password)
            return .success(result?.user)
        }catch {
            
            if let error = error as NSError? {
                guard let errorCode = AuthErrorCode.Code(rawValue: error.code) else {
                    print("There was an error logging in but it could not be matched with a firebase code")
                    return .failure(.unknownError)
                }
                
                switch errorCode{
                case .wrongPassword:
                    return .failure(.wrongPassword)
                case .networkError:
                    return .failure(.networkError)
                default: print("Some error has occured")
                    return .failure(.someUnknownFirebaseCode)
                }
            }
        }
    }
    
}
