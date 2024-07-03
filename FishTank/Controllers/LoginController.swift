//
//  LoginController.swift
//  FishTank
//
//  Created by David Pavlic on 20.04.2024.
//

import SwiftUI
import Firebase

//TODO: Make password invisible

/**
Defines LoginController class inheriting from UIViewController.
Handles user authentication, displaying form fields for username and password, and managing login process.
 */
class LoginController: UIViewController {
    
    /// Represents the Textfield for the username
    @IBOutlet var userTextField: UITextField!
    
    /// Represents the Textfield for the password
    @IBOutlet var passwordTextField: UITextField!
    
    /// Represents the invisible Label, that gets activated on wrong credentials
    @IBOutlet var wrongCredentialsLabel: UILabel!
    
    /// Executed as soon as the view loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        /// Custom background gradient
        applyBackgroundStyle()
    }
    
    /**
     Triggers the login process when the Login button is clicked.
     */
    @IBAction func login(_ sender: UIButton){
        login { [weak self] success in                                                      /// Calls the login method.
                guard let self = self else { return }                                       /// Ensures 'self' is available, preventing a retain cycle.

                if success {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    /// Attempts to instantiate a UITableView from the storyboard using the specified identifier "LoginLoadControllerID". If successful, it casts the instantiated controller to UITabBarController and then sets it as the root view controller of the application's main window.
                    let tabBarController = storyboard.instantiateViewController(withIdentifier: "LoginLoadControllerID")
                    setRootViewController(controller: tabBarController)                     /// Sets it as the root view controller./
                } else {
                    DispatchQueue.main.async {
                        self.wrongCredentialsLabel.text = "Wrong username or password."     /// Updates the label with an error message./
                    }
                }
            }
    }
    
    /**
     Performs user authentication using Firebase Authentication service.

     - Parameters:
       - completion: A completion handler that takes a Boolean indicating whether the login was successful.
     */
    func login(completion: @escaping (Bool) -> Void) {
        /// Attempts to sign in with Firebase using the email and password provided in the text fields.
        Auth.auth().signIn(withEmail: userTextField.text ?? "", password: passwordTextField.text ?? "") { result, error in
            if let error = error {                                                  /// If the error variable is not nill and can be assigned
                print(error.localizedDescription)                                   /// Log the error.
                completion(false)                                                   /// Call the completion handler indicating failure.
            } else {
                UserDefaults.standard.set(result?.user.email, forKey: "userEmail")  /// Store the user's email in UserDefaults.
                completion(true)                                                    /// Call the completion handler indicating success.
            }
        }
    }
    
}
