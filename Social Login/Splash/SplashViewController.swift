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
    let model = ViewModel.viewModel
    
    override func viewWillAppear(_ animated: Bool) {
        let idToken = LocalDataStore.localDataStore.getData().idToken
        let userId = LocalDataStore.localDataStore.getData().userId
        let userEmail = LocalDataStore.localDataStore.getData().userEmail
        
        if idToken == "" && userId == "" &&  userEmail == "" {
            model.showLoginViewController()
        } else {
            model.showMainViewController()
        }
    }
}
