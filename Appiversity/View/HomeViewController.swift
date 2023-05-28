//
//  HomeViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 27/05/2023.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    let viewTitle = "Subjests"
    let homeVCViewModel = HomeVCViewModel()
    let tableView = UITableView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Selectors
    
    @objc func handleSignOutButtonTapped(){
        if homeVCViewModel.userSignedOut(apiService: Service.shared) {
            HomeVCCoordinator.shared.presentLoginViewController()
        }
    }
    
    @objc func handleAddSubjectButtonTapped (){
        print("1234")
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
        configureViewSetting()
        configureSignOutButton()
        configureAddSubjectButton()
        configureTableView()
    }
    
    func configureViewSetting(){
        view.backgroundColor = .systemBackground
        navigationItem.title = viewTitle
        navigationItem.largeTitleDisplayMode = .always
    }
    
    func configureSignOutButton(){
        let signOutButton = UIBarButtonItem(title: "Sign out", style: .done, target: self ,
                                            action: #selector(handleSignOutButtonTapped))
        self.navigationItem.leftBarButtonItem = signOutButton
    }
    
    func configureAddSubjectButton(){
        let addSubjectButton = UIBarButtonItem(image:UIImage(systemName: "plus"), style: .done, target: self ,
                                            action: #selector(handleAddSubjectButtonTapped))
        self.navigationItem.rightBarButtonItem = addSubjectButton
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
}
