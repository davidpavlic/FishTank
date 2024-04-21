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
    @IBOutlet var wrongCredentialsLabel: UILabel!
    
    @State private var username = "David"
    @State private var password = "12345"
    @State private var wrongCredentials = 0
    @State private var showStartScreen = 0
    
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor(red: 0.6, green: 0.85, blue: 1, alpha: 1).cgColor,
                                UIColor.white.cgColor]
        gradientLayer.transform = CATransform3DMakeRotation(CGFloat.pi / 2, 0, 0, 1)
        
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }
    
    @IBAction func login(_ sender: UIButton){
        if(userLabel.text == username && passwordLabel.text == password){
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
        }else{
            wrongCredentialsLabel.text = "Wrong username or password."
        }
    }
    
}
