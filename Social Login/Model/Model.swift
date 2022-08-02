//
//  HomeModel.swift
//  Social Login
//
//  Created by 강조은 on 2022/08/02.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

class Model {
    static let model = Model()
    static let viewModel = ViewModel()
    
    func removeData() {
        let data = UserDataEntity(idToken: "", userId: "", userEmail: "")
        LocalDataStore.localDataStore.setData(newData: data)
    }
}

extension Model: ChangeView {
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
