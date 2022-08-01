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

class LoginViewController: UIViewController {
    let model = ViewModel.viewModel
    
    @IBOutlet weak var googleLoginButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }

    @IBAction func googleLoginButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
    }
}

extension LoginViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print ("Error Google sign In: \(error.localizedDescription)")
            return
        }
        if LocalDataStore.localDataStore.getData().idToken == "" {
            guard let authentication = user.authentication else { return }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            let idToken = authentication.idToken
            let userId = user.userID
            let userEmail = user.profile.email
            
            let data = UserDataEntity(idToken: idToken, userId: userId, userEmail: userEmail)
            
            LocalDataStore.localDataStore.setData(newData: data)
            Auth.auth().signIn(with: credential) {[weak self] _, _ in
                self?.model.showMainViewController()
            }
        } else {
            model.showMainViewController()
        }
    }
}
