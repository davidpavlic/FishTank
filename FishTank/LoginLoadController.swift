//
//  LoginLoadController.swift
//  FishTank
//
//  Created by David Pavlic on 21.04.2024.
//

import SwiftUI

class LoginLoadController: UIViewController {
    
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
        
        //startFiveSecondTimeout()
        
        /*let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "StartTabBarController") as? UITabBarController {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
               let sceneDelegate = windowScene.delegate as? SceneDelegate {
                // Set the root view controller of the window with animation
                sceneDelegate.window?.rootViewController = tabBarController
                sceneDelegate.window?.makeKeyAndVisible()
                // Optionally animate the transition
                UIView.transition(with: sceneDelegate.window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
            }
        }*/
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
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
