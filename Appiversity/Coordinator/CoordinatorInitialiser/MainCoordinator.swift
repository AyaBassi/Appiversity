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
        HomeVCCoordinator.shared
    ]
    
    var childAuthCoordinators: [ChildCoordinatorProtocol] = [
    ]
    
    var homeNavigationController: UINavigationController = UINavigationController()
    var authNavigationController: UINavigationController = UINavigationController(rootViewController: LoginViewController())
    
    func startMainCoordinator() {
        let vc = HomeViewController()
        homeNavigationController.pushViewController(vc, animated: true)
        // set navigationController for all child cordinators
        for var childCoordinator in childCoordinators {
            childCoordinator.navigationController = self.homeNavigationController
        }
        
        for var childAuthCoordinator in childAuthCoordinators {
            childAuthCoordinator.navigationController = self.authNavigationController
        }
    
    }
}


