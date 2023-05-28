//
//  ServiceProtocol.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//
import FirebaseAuth
protocol ServiceProtocol {
    func createUser(withEmail email:String, password:String) async throws -> AuthDataResult
    func signUserIn(withEmail email: String?, password:String?) async throws -> AuthDataResult?
    func signUserOut() throws
}
