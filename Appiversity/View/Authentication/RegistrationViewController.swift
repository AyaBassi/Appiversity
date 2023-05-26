//
//  RegistrationViewController.swift
//  Appiversity
//
//  Created by Payam Karbassi on 24/05/2023.
//

import UIKit
import FirebaseAuth
class RegistrationViewController: UIViewController {
    
    // MARK: - Properties
    let regVM = RegistrationViewModel()
    var termsAndAgreementBoxIsChecked = false
    
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
    
    private lazy var squareAgreementButton : UIButton = {
        let button = UIButton(type: .system)
        guard let emptySquareImage = UIImage(systemName: "square") else {return button}
        button.setImage(emptySquareImage.withTintColor(.lightGray, renderingMode: .alwaysOriginal), for: .normal)
        button.addTarget(self , action: #selector(handleSquareAgreementButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let agreementLabel : UILabel = {
        let label = UILabel()
        label.text = "I agree all statements in "
        label.textColor = .systemGray
        return label
    }()
    
    private lazy var termsOfServiceButton : UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSAttributedString(string: "terms of service", attributes: [
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor : UIColor.orange,
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
        ])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self , action: #selector(handleTermsOfServiceTapped), for: .touchUpInside)
        return button
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
    
    private lazy var alreadyHaveAnAccountButton: UIButton = {
            let button = UIButton(type: .system)
            let attributedTitle = NSMutableAttributedString(string: "Already have an account? ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            attributedTitle.append(NSAttributedString(string: "Login", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.orange]))
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.addTarget(self, action: #selector(handleAlreadyHaveAnAccountButton), for: .touchUpInside)
            
            return button
        }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupLoginTitle()
        add_Email_Password_RepeatPassword_TextFields_And_SquareAgreementCheckBox_AndTermsOfService_And_RegisterButtonToView()
        addAlreadyHaveAnAccountButtonToView()
    }
    
    // MARK: - Selectors
    
    @objc private func handleRegister() {
        
        // 1. Check if email format is valid, check if password is more than 6 characters check if repeat password is same as password
        // 2. also check if terms and condition button is checked
        
        
        if regVM.isValidRegistration(email: emailTextField.text, password: passwordTextField.text, repeatPassword: repeatPasswordTextField.text,termsAndAgreementBoxIsChecked) {
            // 3. once all above conditions are satisfied then create user with firebase authentication
            // 4. And if registration is successful then go to to homescreen

            
        } else {
            print("Registration is not valid")
        }
        
        
    
    }
    @objc private func handleSquareAgreementButtonTapped(){
        termsAndAgreementBoxIsChecked.toggle()
        let result = regVM.setColourAndImageForCheckBox(isChecked: termsAndAgreementBoxIsChecked)
        squareAgreementButton.setImage(UIImage(systemName: result.systemImageName)?.withTintColor(result.colorOfCheckBox, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    @objc private func handleTermsOfServiceTapped() {
        print("handleTermsOfServiceTapped")
    }
    
    @objc func handleAlreadyHaveAnAccountButton(){
        RegistrationVCCoordinator.shared.goToLoginScreen()
    }
    
    // MARK: - Helper functions
    private func setupLoginTitle(){
        view.addSubview(titleLabel)
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        titleLabel.centerX(inView: view)
    }
    
    private func add_Email_Password_RepeatPassword_TextFields_And_SquareAgreementCheckBox_AndTermsOfService_And_RegisterButtonToView(){
        // email, password and repeatpassword in a Vertical stack
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                   passwordContainerView,
                                                   repeatPasswordContainerView])
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 16
        view.addSubview(stack)
        let leftOrRightPadding : Double = 25
        stack.anchor(top: titleLabel.bottomAnchor,
                     left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingTop: 80,
                     paddingLeft: leftOrRightPadding,
                     paddingRight: leftOrRightPadding)
        
        // squareAgreementButton, agreementLabel, termsOfServiceButton in a HStack
        let hStack = UIStackView(arrangedSubviews: [squareAgreementButton,agreementLabel,termsOfServiceButton])
        hStack.axis = .horizontal
        hStack.distribution = .fill
        hStack.spacing = 2
        view.addSubview(hStack)
        hStack.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 25, paddingLeft: 25, paddingRight: 25)

        view.addSubview(registerButton)
        registerButton.anchor(top: stack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: view.frame.height / 10, paddingLeft: leftOrRightPadding, paddingRight: leftOrRightPadding, height: 50)
    }

    private func addAlreadyHaveAnAccountButtonToView() {
            view.addSubview(alreadyHaveAnAccountButton)
        alreadyHaveAnAccountButton.centerX(inView: view)
        alreadyHaveAnAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, height: 32)
        }
    

}
