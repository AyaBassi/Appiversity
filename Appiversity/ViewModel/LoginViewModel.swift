//
//  LoginViewModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//

import Foundation
import FirebaseAuth
class LoginViewModel {
    
    func logUserIn(withEmail email: String?, password:String?, apiService: ServiceProtocol )async -> User? {
        guard let email = email , let password = password else { return nil }
        do {
            let result = try await apiService.signUserIn(withEmail: email, password: password)
            return result?.user
        }catch {
            print("Failed to signed user in: \(error.localizedDescription)")
            return nil
        }
    }
    
}
