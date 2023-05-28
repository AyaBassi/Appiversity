//
//  LoginVCCoordinator.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit
class LoginVCCoordinator : ChildCoordinatorProtocol {
    // a singleton HomeViewcoordinator which will have all navigation codes
    static let shared = LoginVCCoordinator()
    private init(){}
    var navigationController: UINavigationController?
    
    func goToRegistrationScreen(){
        DispatchQueue.main.async {
            let registrationVC = RegistrationViewController()
            self.navigationController?.pushViewController(registrationVC, animated: true)
        }
    }
    
    func dismiss(){
        navigationController?.viewControllers.last?.dismiss(animated: true)
    }
}
