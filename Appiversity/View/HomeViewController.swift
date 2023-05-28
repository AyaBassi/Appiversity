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
     let homeVCViewModel = HomeVCViewModel()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkIfUserIsLoggedIn()
    }
    
    // MARK: - Selectors
    @objc func handleSignOutButtonTapped(){
        if homeVCViewModel.userSignedOut(apiService: Service.shared) {
            HomeVCCoordinator.shared.presentLoginViewController()
        }
    }
    
    // MARK: - Helper functions
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil {
            // show login
            HomeVCCoordinator.shared.presentLoginViewController()
        }else {
            // configure homeView
            configureHomeView()
        }
    }
    
    func configureHomeView(){
        view.backgroundColor = .systemBackground
        
        let signOutButton = UIBarButtonItem(title: "Sign out", style: .done, target: self ,
                                            action: #selector(handleSignOutButtonTapped))
        self.navigationItem.leftBarButtonItem = signOutButton
    }

    

}
