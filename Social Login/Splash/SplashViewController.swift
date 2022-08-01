//
//  SplashViewController.swift
//  Social Login
//
//  Created by 강조은 on 2022/08/01.
//

import UIKit
import Firebase
import GoogleSignIn

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        let idToken = LocalDataStore.localDataStore.getData().idToken
        let userId = LocalDataStore.localDataStore.getData().userId
        let userEmail = LocalDataStore.localDataStore.getData().userEmail
        
        if(idToken == "" && userId == "" &&  userEmail == "") {
            showMainViewController()
        } else {
            showLoginViewController()
        }
    }
    func showLoginViewController() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    func showMainViewController() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

