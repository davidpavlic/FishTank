//
//  UIViewController.swift
//  FishTank
//
//  Created by David Pavlic on 21.04.2024.
//

import SwiftUI

//TODO: Resource Management - Not multiple layers of the same thing
//TODO: Responsive Design
//TODO: Subjective, Method Accessibility (public, private)
//TODO: Magic Numbers

/**
 This extension of UIViewController provides utility functions for UI enhancements and view controller management.
 */
extension UIViewController {
    
    /**
     Applies a gradient background style to the view of the view controller.
     */
    func applyBackgroundStyle() {
        /// Variable that stores a CAGradientLayer.
        let gradientLayer = CAGradientLayer()
        /// Defines the colors, giving it a gradient from light blue to white (as params in the array).
        /// The alpha property defines the opacity.
        gradientLayer.colors = [UIColor(red: 0.6, green: 0.85, blue: 1, alpha: 1).cgColor, UIColor.white.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)    /// Sets the gradients starting point at the bottom for the white color.
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)      /// Sets the gradients ending point at the top for the light blue color.
        /// Sets the frame of the gradient layer to match the bounds of the view, ensuring the gradient layer covers the entire view.
        gradientLayer.frame = self.view.bounds
        /// Inserts the gradient layer at the bottom of the view's layer hierarchy, ensuring it appears as the background behind all other sublayers.
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    /**
     Sets the root view controller of the app's main window.

     - Parameters:
       - controller: The new UIViewController to set as the root view controller.
     */
    func setRootViewController(controller: UIViewController) {
        /// Retrieves the UIWindowScene and SceneDelegate to access the main window.
        /// UIApplication.shared.connectedScenes gets all scenes, casting the first to UIWindowScene.
        /// SceneDelegate manages the scene lifecycle and contains a reference to the main window.
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate else { return }
        
        /// Sets the root view controller of the window to the specified controller.
        let window = sceneDelegate.window
        window?.rootViewController = controller
        /// Makes the window visible and key, making it the primary window for receiving user input, bringing it to the front.
        window?.makeKeyAndVisible()
        /// Adds a transition when changing the root view controller, with a duration of 0.3 seconds.
        UIView.transition(with: window!, duration: 0.3, options: .transitionCrossDissolve, animations: nil, completion: nil)
    }
}
