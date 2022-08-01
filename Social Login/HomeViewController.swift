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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdLabel.text = LocalDataStore.localDataStore.getData().userId
        userEmailLabel.text = LocalDataStore.localDataStore.getData().userEmail
    }
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()

        do {
          // 로그아웃 시도하기
            try firebaseAuth.signOut()
            let story = UIStoryboard(name: "Main", bundle:nil)
            let vc = story.instantiateViewController(withIdentifier: "LoginVC") as! ViewController
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        } catch let signOutError as NSError {
            print("ERROR: signout \(signOutError.localizedDescription)")
        }
    }
    
    @IBAction func revoke(_ sender: Any) {
        
        
    }
    
}
