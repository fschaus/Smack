//
//  LoginVC.swift
//  SmackApp
//
//  Created by Francois Schaus on 2/12/18.
//  Copyright © 2018 Francois Schaus. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func createAccntBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func loginPressed(_ sender: Any) {
        spinner.isHidden = false
        spinner.startAnimating()
        print("Login Pressed")
        
        guard let email = usernameTxt.text , usernameTxt.text != "" else { return }// Where usernameTxt.text is not empty
        guard let pass = passwordTxt.text , passwordTxt.text != "" else { return }
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                print("Request sent")
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        print("Found user by Email")
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setUpView() {
        spinner.isHidden = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(LoginVC.handleTap));
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
}
