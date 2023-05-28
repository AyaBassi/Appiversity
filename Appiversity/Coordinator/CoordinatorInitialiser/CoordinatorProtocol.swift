//
//  CoordinatorProtocol.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit
protocol CoordinatorProtocol {
    var childCoordinators:[ChildCoordinatorProtocol]{get}
    var homeNavigationController : UINavigationController {get set}
    func startMainCoordinator()
}

protocol ChildCoordinatorProtocol {
    var navigationController : UINavigationController?{get set}
    
}


