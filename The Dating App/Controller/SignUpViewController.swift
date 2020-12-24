//
//  SignUpViewController.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/22/20.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase


class SignUpViewController: UIViewController {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var fullnameContainerView: UIView!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    func setupUI() {
        
        setupTitleLabel()
        setupAvatar()
        setupFullnameTextField()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignUpButton()
        setupSignInButton()
        
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        Auth.auth().createUser(withEmail: "test2@gmail.com", password: "123456") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                let dict : Dictionary<String, Any> = [
                    "uid" : authData.user.uid,
                    "email" : authData.user.email,
                    "profileImageUrl" : "",
                    "status" : "Welcome to The Dating App"
                ]
                
                Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict) { (error, ref) in
                    if error == nil {
                        print("Done")
                    }
                }
            }
            
            
        }
        
        
    }
    
    

}
