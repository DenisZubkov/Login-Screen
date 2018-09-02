//
//  LoginViewController.swift
//  Login Screen
//
//  Created by Denis Zubkov on 31/08/2018.
//  Copyright © 2018 Denis Zubkov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    enum ButtonNames: String {
        case login = "Log In"
        case forgotUserName = "Forgot User Name?"
        case forgotPassword = "Forgot Password?"
    }

    @IBOutlet weak var userNameLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var forgotUserNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.setTitle(ButtonNames.login.rawValue, for: .normal)
        forgotUserNameButton.setTitle(ButtonNames.forgotUserName.rawValue, for: .normal)
        forgotPasswordButton.setTitle(ButtonNames.forgotPassword.rawValue, for: .normal)
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! ResultViewController
        let sender = sender as! String
        dvc.result = sender
    }

    @IBAction func anyButtonTapped(_ sender: UIButton) {
        
        var message = sender.titleLabel?.text
        if sender.currentTitle == loginButton.currentTitle {
            guard let userName = userNameLabel.text else { return }
            let trimmedUserName = userName.trimmingCharacters(in: .whitespacesAndNewlines)
            userNameLabel.text = trimmedUserName
            guard trimmedUserName != "" else { return }
            message = userNameLabel.text
        }
        performSegue(withIdentifier: "segueView", sender: message)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
