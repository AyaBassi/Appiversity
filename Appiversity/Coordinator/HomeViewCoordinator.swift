//
//  HomeViewCoordinator.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit
class HomeViewCoordinator : ChildCoordinatorProtocol {
    // a singleton HomeViewcoordinator which will have all navigation codes
    static let shared = HomeViewCoordinator()
    private init(){}
    var navigationController: UINavigationController?
}
