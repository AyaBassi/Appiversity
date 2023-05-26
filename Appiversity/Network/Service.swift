//
//  Service.swift
//  Appiversity
//
//  Created by Payam Karbassi on 26/05/2023.
//

import Foundation
import FirebaseAuth
class Service{
    static let shared = Service()
    private init(){}
    
    func createUser(withEmail email:String, password:String) async throws -> AuthDataResult{
        
        do{
            let result = try await Auth.auth().createUser(withEmail: email , password: password)
            return result
        }
        catch {
            throw error
        }
    }
}
