//
//  LoginViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 22/05/2023.
//

import UIKit
//import FirebaseAnalytics

class LoginViewController: UIViewController {
    
    // MARK: - PROPERTIES
    lazy var loginButtonTitle:String? = "Log in"
    
    lazy var topPaddingForEmailAndPasswordStack = view.frame.height / 7
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "emailImage").withTintColor(.lightGray), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "passwordImage").withTintColor(.lightGray), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email",
                                       isSecureTextEntry: false)
    }()
    
    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password",
                                       isSecureTextEntry: true)
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(loginButtonTitle, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        return button
    }()
    
    private lazy var dontHaveAccountButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Don't have an account yet? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            attributedTitle.append(NSAttributedString(string: "Register", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.orange]))
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.addTarget(self, action: #selector(handleDontHaveAccountButton), for: .touchUpInside)
            
            return button
        }()
    
    
    // MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        removeNavigationBar()
        
        setupLoginTitle()
        
        add_Email_Password_Container_And_LoginButtonToView()
        
        addDontHaveAccountButtonToView()
    }
    
    
    // MARK: - Selectors
    
    
    @objc func handleLogin() {
        print(1234)
        LoginVCCoordinator.shared.dismiss()
    }
    
    @objc func handleDontHaveAccountButton(){
        LoginVCCoordinator.shared.goToRegistrationScreen()
    }
    
    // MARK: - HELPER FUNCTIONS
    
    private func removeNavigationBar(){
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupLoginTitle(){
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }
    
    private func add_Email_Password_Container_And_LoginButtonToView(){
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        view.addSubview(stack)
        
        let leftOrRightPadding : Double = 25
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: topPaddingForEmailAndPasswordStack,
                     paddingLeft: leftOrRightPadding,
                     paddingRight: leftOrRightPadding)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 10, paddingLeft: leftOrRightPadding,paddingRight: leftOrRightPadding, height: 50)
    }
    
    private func addDontHaveAccountButtonToView() {
            view.addSubview(dontHaveAccountButton)
            dontHaveAccountButton.centerX(inView: view)
            dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        }
    
    deinit{
        print("Login is Deinit")
    }
}



//Analytics.logEvent(AnalyticsEventSelectContent, parameters: [
//  AnalyticsParameterItemID: "id-\(loginButtonTitle!)",
//  AnalyticsParameterItemName: loginButtonTitle!,
//  AnalyticsParameterContentType: "cont",
//])
