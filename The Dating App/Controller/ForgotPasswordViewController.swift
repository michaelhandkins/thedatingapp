//
//  ForgotPasswordViewController.swift
//  The Dating App
//
//  Created by Michael Handkins on 12/22/20.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var emailContainerView: UIView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    

    func setupUI() {
        
        setupEmailTextField()
        setupResetButton()
        
    }
    

}
