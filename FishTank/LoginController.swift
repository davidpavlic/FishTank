//
//  LoginController.swift
//  FishTank
//
//  Created by David Pavlic on 20.04.2024.
//

import SwiftUI

class LoginController: UIViewController {
    
    @IBOutlet var userLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    
    @State private var username = "David"
    @State private var password = "12345"
    @State private var wrongCredentials = 0
    @State private var showStartScreen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view")
    }
    
    @IBAction func login(_ sender: UIButton){
        if(userLabel.text == username && passwordLabel.text == password){
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let tabBarController = storyboard.instantiateViewController(withIdentifier: "StartTabBarController") as? UITabBarController {
                    // You can configure properties of the tabBarController here if needed
                    // Example: setting the selected tab, etc.

                // Retrieve the SceneDelegate from the connected scene
                if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                   let sceneDelegate = windowScene.delegate as? SceneDelegate {
                    // Set the root view controller of the window with animation
                    sceneDelegate.window?.rootViewController = tabBarController
                    sceneDelegate.window?.makeKeyAndVisible()

                    // Optionally animate the transition
                    UIView.transition(with: sceneDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
                }
            }
        }else{
            userLabel.text = "Fail"
        }
    }
    
}
