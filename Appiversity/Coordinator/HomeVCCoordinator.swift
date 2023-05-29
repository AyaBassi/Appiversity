//
//  HomeVCCoordinator.swift
//  Appiversity
//
//  Created by Payam Karbassi on 27/05/2023.
//

import UIKit
import SwiftUI
class HomeVCCoordinator: ChildCoordinatorProtocol {
    
    static let shared = HomeVCCoordinator()
    
    private init(){}
    
    var navigationController: UINavigationController?
    
    func presentLoginViewController(){
        let loginVC = LoginViewController()
        let authNavigationController = UINavigationController(rootViewController: loginVC)
        authNavigationController.isModalInPresentation = true
        authNavigationController.modalPresentationStyle = .fullScreen
        LoginVCCoordinator.shared.navigationController = authNavigationController
        RegistrationVCCoordinator.shared.navigationController = authNavigationController
        navigationController?.viewControllers.last?.present(authNavigationController, animated: true)
    }
    
    func goToSwiftUIScreen(){
        let swiftUIScreen = UIHostingController(rootView: SwiftUIView())
        navigationController?.pushViewController(swiftUIScreen, animated: true)
    }
}
