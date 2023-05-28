//
//  HomeVCViewModel.swift
//  Appiversity
//
//  Created by Payam Karbassi on 28/05/2023.
//

import Foundation
class HomeVCViewModel {
    
    func userSignedOut(apiService: LoginLogOutProtocol)-> Bool{
        do {
            try apiService.signUserOut()
            return true
        }catch{
            print("error signing out\(error.localizedDescription)")
            return false
        }
    }
    
}
