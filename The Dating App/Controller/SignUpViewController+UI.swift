//
//  SignUpViewController+UI.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/22/20.
//

import UIKit

extension SignUpViewController {

    func setupTitleLabel() {
        let title = "Sign Up"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
             NSAttributedString.Key.foregroundColor : UIColor.black])
        
        titleTextLabel.attributedText = attributedText
    }
    
    func setupAvatar() {
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
    }
    
    func setupFullnameTextField() {
        
    }
    
    func setupEmailTextField() {
        
    }
    
    func setupPasswordTextField() {
        
    }
    
    func setupSignUpButton() {
        
    }
    
    func setupSignInButton() {
        
    }

}
