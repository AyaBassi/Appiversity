//
//  RegistrationVCCoordinator.swift
//  Appiversity
//
//  Created by Payam Karbassi on 24/05/2023.
//

import UIKit
class RegistrationVCCoordinator : ChildCoordinatorProtocol {
    // a singleton HomeViewcoordinator which will have all navigation codes
    static let shared = RegistrationVCCoordinator()
    private init(){}
    var navigationController: UINavigationController?
    
    
    func goToLoginScreen(){
        DispatchQueue.main.async {
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
