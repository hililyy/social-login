//
//  AppDelegate.swift
//  Social Login
//
//  Created by 강조은 on 2022/07/28.
//

import UIKit
import Firebase
import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

extension AppDelegate: GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // Error 처리 (어떤 에러인지)
        if let error = error {
            print ("Error Google sign In: \(error.localizedDescription)")
            return
        }
        
        // User의 인증 값 (없으면 Return)
        guard let authentication = user.authentication else { return }
        
        // credential : google Id token/ access 를 위임을 부여 받음 --> 구글에서 전해준 토큰을 부여 받음
        
        
        
        if LocalDataStore.localDataStore.getData().idToken == "" {
            // firebase 인증 정보로 등록하기 위해서 signIn
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            let idToken = authentication.idToken
            let userId = user.userID
            let userEmail = user.profile.email
            
            let data = UserDataEntity(idToken: idToken, userId: userId, userEmail: userEmail)
            
            LocalDataStore.localDataStore.setData(newData: data)
            Auth.auth().signIn(with: credential) {[weak self] _, _ in
                self?.showMainViewController()
            }
        }
        else {
            self.showMainViewController()
        }
    }
    
    private func showMainViewController() {
        let story = UIStoryboard(name: "Main", bundle:nil)
        let vc = story.instantiateViewController(withIdentifier: "HomeVC") as! HomeViewController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
}
