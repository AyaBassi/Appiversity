//
//  MainCoordinator.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit
class MainCoordinator :  CoordinatorProtocol{
    // creating a singleton MainCoordinator
    static let shared = MainCoordinator()
    private init(){}
    
    var childCoordinators: [ChildCoordinatorProtocol] = [
        LoginVCCoordinator.shared,
        RegistrationVCCoordinator.shared
    ]
    var navigationController: UINavigationController = UINavigationController()
    
    func startMainCoordinator() {
        let vc = LoginViewController()
        navigationController.pushViewController(vc, animated: true)
        
        // set navigationController for all child cordinators
        for var childCoordinator in childCoordinators {
            childCoordinator.navigationController = self.navigationController
        }
    }
}


