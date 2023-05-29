//
//  Service.swift
//  Appiversity
//
//  Created by Payam Karbassi on 26/05/2023.
//

import FirebaseAuth
import FirebaseDatabase

class Service : ServiceProtocol{
    
    static let shared = Service()
    private init(){}
    
    // MARK: Authentication
    
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
    
    func signUserIn(withEmail email: String?, password:String?) async throws -> AuthDataResult?{
        guard let email = email ,let password = password else {return nil}
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            return result
        }catch (let error){
            print("error signing user in\(error.localizedDescription)")
            throw error
        }
    }
    
    func signUserOut() throws {
        do{
            try Auth.auth().signOut()
            print("user signed out")
        }catch {
            throw error
        }
    }
    
    // MARK: - Fething Data
    
    func fetchSubject(completion: @escaping (DataSnapshot)->Void) {
        ServiceEndPoints.SUBJECTS_REF.observeSingleEvent(of: .value, with: completion)
    }
}


