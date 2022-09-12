//
//  ViewController.swift
//  Bankey
//
//  Created by MEP LAB 01 on 12/09/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    let signinButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    var userName: String? {
        return loginView.userNameTextField.text
    }
    
    var password: String? {
        return loginView.userNameTextField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signinButton.translatesAutoresizingMaskIntoConstraints = false
        signinButton.configuration = .filled()
        signinButton.configuration?.imagePadding = 8
        signinButton.setTitle("Sign In", for: [])
        signinButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 1
        errorMessageLabel.isHidden = true
    }
    
    func layout() {
        view.addSubview(loginView)
        view.addSubview(signinButton)
        view.addSubview(errorMessageLabel)
        
        // Login View
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        // Sign In Button
        NSLayoutConstraint.activate([
            signinButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signinButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Error message label
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signinButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    
    @objc
    func signInTapped() {
        errorMessageLabel.isHidden = true
        login()
    }
    
    func login() {
        guard let userName = userName, let password = password else {
            assertionFailure("Username / password should never be nil")
            return
        }
            
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage: "Username/ password cannot be empty")
        }
        
        if userName == "Kevin" || password == "Welcome" {
            signinButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Username/Password is incorrect")
        }
    }
    
    func configureView(withMessage message: String) {
        errorMessageLabel.text = message
        errorMessageLabel.isHidden = false
    }
}

