//
//  LoginController.swift
//  FishTank
//
//  Created by David Pavlic on 20.04.2024.
//

import SwiftUI
import Firebase

class LoginController: UIViewController {
    
    @IBOutlet var userLabel: UITextField!
    @IBOutlet var passwordLabel: UITextField!
    @IBOutlet var wrongCredentialsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyBackgroundStyle()
    }
    
    @IBAction func login(_ sender: UIButton){
        login { [weak self] success in
                guard let self = self else { return }

                if success {
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        if let tabBarController = storyboard.instantiateViewController(withIdentifier: "LoginLoadControllerID") as? UIViewController {
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
                } else {
                    DispatchQueue.main.async {
                        self.wrongCredentialsLabel.text = "Wrong username or password."
                    }
                }
            }
    }
    
    func login(completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: userLabel.text ?? "", password: passwordLabel.text ?? "") { result, error in
            if let error = error {
                print(error.localizedDescription)
                completion(false)  // Call completion with false on error
            } else {
                UserDefaults.standard.set(result?.user.email, forKey: "userEmail")
                completion(true)   // Call completion with true on successful login
            }
        }
    }
    
}
