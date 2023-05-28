//
//  HomeViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 27/05/2023.
//

import UIKit
import FirebaseAuth

protocol HomeViewControllerProtocol{
    func goToLoginViewController()
}

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn() ? configureHomeView() : HomeVCCoordinator.shared.presentLoginViewController()
    }
    
    // MARK: - Selectors
    
    // MARK: - Helper functions
    
    func checkIfUserIsLoggedIn() -> Bool{
        Auth.auth().currentUser == nil ? false : true
    }
    
    func configureHomeView(){
        view.backgroundColor = .purple
    }

    

}
