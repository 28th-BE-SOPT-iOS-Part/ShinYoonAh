//
//  SignUpModel.swift
//  PA1
//
//  Created by SHIN YOON AH on 2021/05/13.
//

import Foundation

// MARK: - SignUpModel
struct SignUpModel: Codable {
    let success: Bool
    let message: String
    let data: SignupUser?
    
    enum CodingKeys: String, CodingKey {
        case success
        case message
        case data
    }
    
    init(from decoder : Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        success = (try? values.decode(Bool.self, forKey: .success)) ?? false
        message = (try? values.decode(String.self, forKey: .message)) ?? ""
        data = (try? values.decode(SignupUser.self, forKey: .data)) ?? nil
    }
}

// MARK: - SignupUser
struct SignupUser: Codable {
    let nickname: String
}

