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
        HomeViewCoordinator.shared.self
    ]
    var navigationController: UINavigationController = UINavigationController()
    
    func startMainCoordinator() {
        let vc = ViewController()
        navigationController.pushViewController(vc, animated: true)
        
        // set navigationController for all child cordinators
        for var childCoordinator in childCoordinators {
            childCoordinator.navigationController = self.navigationController
        }
    }
}


