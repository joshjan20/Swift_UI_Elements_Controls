//
//  LoginViewController.swift
//  Swift_UI_Elements_Controls
//
//  Created by JJ on 27/09/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Create UI elements
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Login"
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let grayButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Gray Button", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let tintedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tinted Button", for: .normal)
        button.tintColor = .red
        button.setTitleColor(.red, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pullDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pull Down", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let pullUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Pull Up", for: .normal)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = .white
        
        // Add all elements to the view
        view.addSubview(titleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(grayButton)
        view.addSubview(tintedButton)
        view.addSubview(pullDownButton)
        view.addSubview(pullUpButton)
        
        // Set button targets
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        grayButton.addTarget(self, action: #selector(handleGrayButton), for: .touchUpInside)
        tintedButton.addTarget(self, action: #selector(handleTintedButton), for: .touchUpInside)
        pullDownButton.addTarget(self, action: #selector(handlePullDown), for: .touchUpInside)
        pullUpButton.addTarget(self, action: #selector(handlePullUp), for: .touchUpInside)
        
        setupConstraints()
    }
    
    // Set up constraints for the UI elements
    func setupConstraints() {
        NSLayoutConstraint.activate([
            // Title Label Constraints
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 200),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            // Username TextField Constraints
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Password TextField Constraints
            passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 250),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Login Button Constraints
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 100),
            loginButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Gray Button Constraints
            grayButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            grayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            grayButton.widthAnchor.constraint(equalToConstant: 150),
            grayButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Tinted Button Constraints
            tintedButton.topAnchor.constraint(equalTo: grayButton.bottomAnchor, constant: 20),
            tintedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tintedButton.widthAnchor.constraint(equalToConstant: 150),
            tintedButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Pull Down Button Constraints
            pullDownButton.topAnchor.constraint(equalTo: tintedButton.bottomAnchor, constant: 20),
            pullDownButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pullDownButton.widthAnchor.constraint(equalToConstant: 150),
            pullDownButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Pull Up Button Constraints
            pullUpButton.topAnchor.constraint(equalTo: pullDownButton.bottomAnchor, constant: 20),
            pullUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pullUpButton.widthAnchor.constraint(equalToConstant: 150),
            pullUpButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // Handle button actions
    @objc func handleLogin() {
        let dashboardVC = DashboardViewController()
        navigationController?.pushViewController(dashboardVC, animated: true)
    }
    
    @objc func handleGrayButton() {
        print("Gray Button Pressed")
    }
    
    @objc func handleTintedButton() {
        print("Tinted Button Pressed")
    }
    
    @objc func handlePullDown() {
        let alert = UIAlertController(title: "Pull Down", message: "Pull Down action triggered!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @objc func handlePullUp() {
        let alert = UIAlertController(title: "Pull Up", message: "Pull Up action triggered!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

