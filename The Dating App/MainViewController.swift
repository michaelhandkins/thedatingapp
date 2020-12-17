//
//  ViewController.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/16/20.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var signInWithFacebook: UIButton!
    @IBOutlet weak var signInWithGoogle: UIButton!
    @IBOutlet weak var orLabel: UILabel!
    @IBOutlet weak var createAccountButton: UIButton!
    @IBOutlet weak var termsOfServiceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        
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
        
        orLabel.text = "Or"
        orLabel.font = UIFont.boldSystemFont(ofSize: 16)
        orLabel.textColor = UIColor(white: 0, alpha: 0.45)
        orLabel.textAlignment = .center
        
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


}

