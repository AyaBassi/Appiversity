//
//  HomeViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 27/05/2023.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    let viewTitle = "Subjects"
    let homeVCViewModel = HomeVCViewModel()
    let refreshControl = UIRefreshControl()
    let tableView = UITableView()
    
    var subjects:[String] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
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
    
    @objc func handleAddSubjectButtonTapped (){
        let alertController = UIAlertController(title: "Add a Subject", message: "", preferredStyle: .alert)
        alertController.addTextField { textfield in textfield.placeholder = "Enter a subject..." }
        
        let cancelButtonAction = UIAlertAction(title: "Cancel", style: .destructive)
        let saveSubjectButton = UIAlertAction(title: "Save", style: .default) { alertAction in
            if let tf = alertController.textFields?.first{
                if tf.text?.count ?? 0 > 0 {
                    guard let subject = tf.text else { return}
                    guard let uid = Auth.auth().currentUser?.uid else {return}
                    let now = Date()
                    let formatter = DateFormatter()
                    formatter.timeZone = TimeZone.current
                    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                    let dateString = formatter.string(from: now)
                    ServiceEndPoints.SUBJECTS_REF.child(uid).childByAutoId().updateChildValues(["subject": subject,"timeAdded": dateString]) { error , ref in
                        if error != nil{
                            print("error saving subject")
                            return
                        }
                        print("Successfuly saved subject")
                    }
                }
            }
        }
        alertController.addAction(cancelButtonAction)
        alertController.addAction(saveSubjectButton)
        alertController.preferredAction = saveSubjectButton
        self.present(alertController, animated: true)
    }
    
    @objc func refresh(_ sender: AnyObject) {
       // Code to refresh table view
        var listArray : [String] = []
        ServiceEndPoints.SUBJECTS_REF.observeSingleEvent(of: .value) { snapshot in
            for childSnap in snapshot.children.allObjects {
                let snap = childSnap as! DataSnapshot
                guard let dictonaries = (snap.value as? NSDictionary) else {return}
                for dic in dictonaries {
                    guard let diction = dictonaries[dic.key as Any] as? [String:Any] else {continue}
                    for (key,val) in diction {
                        if key == "subject" {
                            listArray.append(val as! String)
                        }
                    }
                }
            }
            self.subjects = listArray
            listArray.removeAll()
            self.refreshControl.endRefreshing()
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
        configureViewSetting()
        configureSignOutButton()
        configureAddSubjectButton()
        configureTableView()
        configureRefresh()
        refresh(self)
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
    
    func configureRefresh(){
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to Refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
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
        return subjects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = subjects[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
