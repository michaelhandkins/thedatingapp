//
//  SignInViewController.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/22/20.
//

import UIKit
import ProgressHUD

class SignInViewController: UIViewController {
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordContainerView: UIView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }
    
    func setupUI() {
        
        setupTitleLabel()
        setupEmailTextField()
        setupPasswordTextField()
        setupSignInButton()
        setupSignUpButton()
        
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInPressed(_ sender: Any) {
        
        self.view.endEditing(true)
        self.validateFields()
        self.signIn {
            // switch view
        } onError: { (error) in
            ProgressHUD.showError(error)
        }

        
    }
    
    

}
