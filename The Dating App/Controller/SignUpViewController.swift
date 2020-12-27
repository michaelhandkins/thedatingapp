//
//  SignUpViewController.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/22/20.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage
import ProgressHUD

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
    
    var image: UIImage? = nil
    
    
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
    
    func validateFields() {
        guard let username = self.fullnameTextField.text, !username.isEmpty else {
            ProgressHUD.showError("Please enter a username")
            return
        }
        
        guard let email = self.emailTextField.text, !email.isEmpty else {
            ProgressHUD.showError("Please enter an email address")
            return
        }
        
        guard let password = self.passwordTextField.text, !password.isEmpty else {
            ProgressHUD.showError("Please enter a password")
            return
        }
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        
        self.view.endEditing(true)
        
        self.validateFields()
        
        guard let imageSelected = self.image else  {
            ProgressHUD.showError("Please choose your profile picture")
            return
        }
        
        guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else {
            return
        }
        
        Auth.auth().createUser(withEmail: "test5@gmail.com", password: "123456") { (authDataResult, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            if let authData = authDataResult {
                print(authData.user.email)
                var dict : Dictionary<String, Any> = [
                    "uid" : authData.user.uid,
                    "email" : authData.user.email,
                    "profileImageUrl" : "",
                    "status" : "Welcome to The Dating App"
                ]
                
                let storageRef = Storage.storage().reference(forURL: "gs://thedatingapp-f3ed6.appspot.com")
                let storageProfileRef = storageRef.child("profile").child(authData.user.uid)
                
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpg"
                storageProfileRef.putData(imageData, metadata: metadata) { (storageMetaData, error) in
                    if error != nil {
                        print(error?.localizedDescription)
                        return
                    }
                    
                    storageProfileRef.downloadURL { (url, error) in
                        if let metaImageUrl = url?.absoluteString {
                            dict["profileImageUrl"] = metaImageUrl
                            
                            Database.database().reference().child("users").child(authData.user.uid).updateChildValues(dict) { (error, ref) in
                                if error == nil {
                                    print("Done")
                                }
                            }
                        }
                    }
                }
                
            }
            
            
        }
        
        
    }
    
    

}
