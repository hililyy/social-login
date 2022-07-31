//
//  ViewController.swift
//  Social Login
//
//  Created by 강조은 on 2022/07/28.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

class ViewController: UIViewController {

    
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }

    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

