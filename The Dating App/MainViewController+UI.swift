//
//  MainViewController+UI.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/17/20.
//

import UIKit

extension MainViewController {
    
    func setupHeaderTitle() {
        let title = "Create a new account"
        let subtitle = "\n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do"
        
        let attributedText = NSMutableAttributedString(string: title, attributes:
            [NSAttributedString.Key.font : UIFont.init(name: "Didot", size: 28)!,
             NSAttributedString.Key.foregroundColor : UIColor.black])
        let attributedSubtitle = NSMutableAttributedString(string: subtitle, attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16),
             NSAttributedString.Key.foregroundColor : UIColor.black])
        attributedText.append(attributedSubtitle)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 5
        
        attributedText.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedText.length))
        titleLabel.numberOfLines = 0
        
        titleLabel.attributedText = attributedText
    }
    
    func setupOrLabel() {
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
    }
    
    func setupTermsLabel() {
        let attributedTermsText = NSMutableAttributedString(string: "By clicking \"Create a new account\" you agree to our ", attributes:
            [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 14),
             NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        let attributedSubTermsText = NSMutableAttributedString(string: "Terms of Service.", attributes:
            [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14),
             NSAttributedString.Key.foregroundColor : UIColor(white: 0, alpha: 0.65)])
        
        attributedTermsText.append(attributedSubTermsText)
        
        termsOfServiceLabel.attributedText = attributedTermsText
        termsOfServiceLabel.numberOfLines = 0
    }
    
    func setupFacebookButton() {
        signInWithFacebook.setTitle("Sign in with Facebook", for: .normal)
        signInWithFacebook.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInWithFacebook.backgroundColor = UIColor(red: 58/255, green: 85/255, blue: 159/255, alpha: 1)
        signInWithFacebook.layer.cornerRadius = 5
        signInWithFacebook.clipsToBounds = true
    }
    
    func setupGoogleButton() {
        signInWithGoogle.setTitle("Sign in with Google", for: .normal)
        signInWithGoogle.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        signInWithGoogle.backgroundColor = UIColor(red: 223/255, green: 74/255, blue: 50/255, alpha: 1)
        signInWithGoogle.layer.cornerRadius = 5
        signInWithGoogle.clipsToBounds = true
    }
    
    func setupCreateAccountButton() {
        createAccountButton.setTitle("Create a new account", for: .normal)
        createAccountButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        createAccountButton.backgroundColor = UIColor.black
        createAccountButton.layer.cornerRadius = 5
        createAccountButton.clipsToBounds = true
    }
    
}
