//
//  RegistrationViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 24/05/2023.
//

import UIKit

class RegistrationViewController: UIViewController {

    
    // MARK: - Properties
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Register"
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        label.textColor = .lightGray
        return label
    }()
    
    private let emailTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Email",
                                       isSecureTextEntry: false)
    }()
    
    private lazy var emailContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "emailImage").withTintColor(.lightGray), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    

    private let passwordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Password",
                                       isSecureTextEntry: true)
    }()
    
    private lazy var passwordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "passwordImage").withTintColor(.lightGray), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let repeatPasswordTextField: UITextField = {
        return UITextField().textField(withPlaceholder: "Repeat Password",
                                       isSecureTextEntry: true)
    }()
    
    private lazy var repeatPasswordContainerView: UIView = {
        let view = UIView().inputContainerView(image: #imageLiteral(resourceName: "passwordImage").withTintColor(.lightGray), textField: repeatPasswordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(handleRegister), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.backgroundColor = .orange
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLoginTitle()
        add_Email_Password_RepeatPassword_Container_And_RegisterButtonToView()
    }
    
    // MARK: - Selectors
    
    @objc private func handleRegister() {
        print(1234)
    }
    
    // MARK: - Helper functions
    private func setupLoginTitle(){
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }
    
    private func add_Email_Password_RepeatPassword_Container_And_RegisterButtonToView(){
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   repeatPasswordContainerView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        view.addSubview(stack)
        
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 80,
                     paddingLeft: 20,
                     paddingRight: 20)
        
        view.addSubview(registerButton)
        registerButton.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 10, paddingLeft: 22, paddingRight: 22, height: 50)
    }

    

}
