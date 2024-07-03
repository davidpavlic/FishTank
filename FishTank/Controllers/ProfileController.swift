//
//  ProfileController.swift
//  FishTank
//
//  Created by David Pavlic on 27.04.2024.
//

import SwiftUI
import Firebase

//TODO: Write a class for database manipulations
//TODO: Implement some MVC
//TODO: Error Handling (Comes with Firebase implementation)

/**
Defines ProfileController class inheriting from UIViewController.
Represents the form with user data and lets the user configure it.
 */
class ProfileController: UIViewController {
    
    /// Represents the Textfield for the email
    @IBOutlet var emailTextField: UITextField!
    
    /// Represents the Textfield for the firstname
    @IBOutlet var firstNameTextField: UITextField!
    
    /// Represents the Textfield for the lastname
    @IBOutlet var lastNameTextField: UITextField!
    
    /**
     Called after the controller's view is loaded into memory.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        applyBackgroundStyle()                                                          /// Custom background gradient.
        
        /// Retrieves the signed-in user's email from Firebase Authentication and sets it as text. If the value is empty it will be nil.
        emailTextField.text = Auth.auth().currentUser?.email
        /// Calls the `fetchUserData` function, passing the current user's UID from Firebase Authentication as the argument.
        fetchUserData(authFk: Auth.auth().currentUser?.uid ?? "")
    }
    
    //TODO: store user data in page
    /**
     Defines a function to fetch user data from Firestore.
     */
    func fetchUserData(authFk: String) {
        let db = Firestore.firestore()                                                  /// Initializes a Firestore instance.
        db.collection("users").whereField("auth_fk", isEqualTo: authFk)                 /// Queries users collection by auth_fk.
          .getDocuments { (querySnapshot, err) in                                       // TODO: Firebase Comment
              if let err = err {
                  print("Error getting documents: \(err)")                              /// Prints an error message if present.
              } else {
                  for document in querySnapshot!.documents {                            // TODO: Firebase Comment
                      if let firstName = document.data()["first_name"] as? String {     // TODO: Firebase Comment
                          self.firstNameTextField.text = firstName                      // TODO: Firebase Comment
                      }
                  }
              }
          }
    }
    
}
