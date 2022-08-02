//
//  HomeViewController.swift
//  Social Login
//
//  Created by 강조은 on 2022/08/01.
//

import UIKit
import Firebase
import GoogleSignIn

class HomeViewController: UIViewController {

    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    let model = ViewModel.viewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdLabel.text = LocalDataStore.localDataStore.getData().userId
        userEmailLabel.text = LocalDataStore.localDataStore.getData().userEmail
    }
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            model.removeData()
            model.showLoginViewController()
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    
    @IBAction func revoke(_ sender: Any) {
        let user = Auth.auth().currentUser
        do {
            try user?.delete()
            model.removeData()
            model.showLoginViewController()
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
}
