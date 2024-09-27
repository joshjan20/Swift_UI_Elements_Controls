//
//  ViewController.swift
//  Swift_UI_Elements_Controls
//
//  Created by JJ on 27/09/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        title = "Main View"
        
        // Create a button to navigate to PostsViewController
        let navigateButton = UIButton(type: .system)
        navigateButton.setTitle("Go to Login", for: .normal)
        navigateButton.addTarget(self, action: #selector(navigateToLogin), for: .touchUpInside)
        navigateButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(navigateButton)
        
        // Set up button constraints
        NSLayoutConstraint.activate([
            navigateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            navigateButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc func navigateToLogin() {
            print("navigateToLogin")
           // Instantiate PostsViewController
        let loginViewController = LoginViewController()
                
                // Check if navigationController is not nil
                if let navController = navigationController {
                    // Push PostsViewController onto the navigation stack
                    navController.pushViewController(loginViewController, animated: true)
                } else {
                    print("Navigation Controller is nil.")
                }
       }
}

