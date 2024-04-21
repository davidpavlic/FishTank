//
//  LoginLoadController.swift
//  FishTank
//
//  Created by David Pavlic on 21.04.2024.
//

import SwiftUI

class LoginLoadController: UIViewController {
    
    @IBOutlet var welcomeLabel: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyBackgroundStyle()
        
        welcomeLabel.text = "WELCOME: " + (UserDefaults.standard.string(forKey: "userEmail") ?? "USER")
        activityIndicator.startAnimating()
        
        // Start a 5-second timeout before navigating
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { [weak self] _ in
            self?.navigateToTabBarController()
        }
    }
    
    func navigateToTabBarController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "StartTabBarControllerID") as? UITabBarController {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                // Set the root view controller of the window with animation
                sceneDelegate.window?.rootViewController = tabBarController
                sceneDelegate.window?.makeKeyAndVisible()
                // Optionally animate the transition
                UIView.transition(with: sceneDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }
    }
    
    func startFiveSecondTimeout() {
        // Create a timer that fires after 5 seconds
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            print("5 seconds have passed. The timer will now invalidate.")
            // Code to execute after the timeout here
            
            // Optionally invalidate the timer if it's not repeating
            timer.invalidate()
        }
    }
    
}
