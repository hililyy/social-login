//
//  HomeViewModel.swift
//  Social Login
//
//  Created by 강조은 on 2022/08/02.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

class ViewModel {
    let model = Model.model
    static let viewModel = ViewModel()
    
    func removeData() {
        model.removeData()
    }
}

extension ViewModel: ChangeView {
    func showMainViewController() {
        model.showMainViewController()
    }
    func showLoginViewController() {
        model.showLoginViewController()
    }
}
