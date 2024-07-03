//
//  LoginLoadController.swift
//  FishTank
//
//  Created by David Pavlic on 21.04.2024.
//

import SwiftUI

/**
Defines LoginLoadController class inheriting from UIViewController.
Manages the initial loading screen where user data is loaded and navigates to the main application UI.
 */
class LoginLoadController: UIViewController {
    
    /// Represents the TextField for displaying the welcome message.
    @IBOutlet var welcomeLabel: UITextField!    // TODO: Change to UILabel!
    
    /// Represents the activity indicator that shows loading progress.
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    /**
     Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadDataAndNavigate()
    }

    /**
     Sets up user interface components on the screen.
     */
    private func setUpUI(){
        applyBackgroundStyle()                  /// Custom background gradient.
        configureWelcomeLabel()                 /// Configures the welcome label with user's email or default text.
        activityIndicator.startAnimating()      /// Starts the activity indicator animation.
    }
    
    /**
     Loads necessary user data and transitions to the main app interface after a delay.
     */
    private func loadDataAndNavigate(){
        // TODO: Get all necessary user data
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.navigateToTabBarController()
        }
    }
    
    /**
     Navigates to the main tab bar controller defined in the storyboard.
     */
    private func navigateToTabBarController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)    /// Initializes the main storyboard.
        /// Attempts to instantiate a UITabBarController from the storyboard using the specified identifier "StartTabBarControllerID". If successful, it casts the instantiated controller to UITabBarController and then sets it as the root view controller of the application's main window.
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "StartTabBarControllerID") as? UITabBarController {
            setRootViewController(controller: tabBarController)
        }
    }
    
    /**
     Configures the welcome label to display the user's email or a default greeting.
     */
    private func configureWelcomeLabel() {
        let userKey = "userEmail"
        let defaultEmail = "USER"
        /// Retrieves the user's email from UserDefaults or uses the default.
        let userEmail = UserDefaults.standard.string(forKey: userKey) ?? defaultEmail
        welcomeLabel.text = "WELCOME: \(userEmail)"
    }
}
