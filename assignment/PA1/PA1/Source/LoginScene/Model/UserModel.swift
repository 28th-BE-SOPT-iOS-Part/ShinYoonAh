//
//  UserModel.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/05/13.
//

import Foundation

// MARK: - UserModel
struct UserModel: Codable {
    let success: Bool
    let message: String
    let data: User?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(User.self, forKey: .data)) ?? nil
    }
}

// MARK: - User
struct User: Codable {
    let userID: Int
    let userNickname, token: String

    enum CodingKeys: String, CodingKey {
        case userID = "UserId"
        case userNickname = "user_nickname"
        case token
    }
}
