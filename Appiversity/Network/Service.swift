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
            print("There was an error")
            throw error
        }
    }
    
    
    func signUserIn(withEmail email: String?, password:String?) async throws {
        guard let email = email ,let password = password else {return}
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
        }catch {
            print("error signing user in\(error.localizedDescription)")
            throw error
        }
    }
    
    func signUserOut(){
        guard Auth.auth().currentUser != nil else {return}
       
        do{
            try Auth.auth().signOut()
            print("user signed out")
        }catch {
            print("DEBUG: ERROR signing out,\(error.localizedDescription)")
        }
    }
}
