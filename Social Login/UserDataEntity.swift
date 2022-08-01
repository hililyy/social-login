//
//  UserDataEntity.swift
//  Social Login
//
//  Created by 강조은 on 2022/08/01.
//

import Foundation

struct UserDataEntity: Codable {
    let idToken: String?
    let userId: String?
    let userEmail: String?
}
