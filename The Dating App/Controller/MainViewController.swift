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
        
        setupHeaderTitle()
        setupOrLabel()
        setupTermsLabel()
        setupFacebookButton()
        setupCreateAccountButton()
        
    }


}

