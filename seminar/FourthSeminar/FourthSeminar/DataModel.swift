//
//  DataModel.swift
//  FourthSeminar
//
//  Created by SHIN YOON AH on 2021/05/08.
//

import Foundation

// MARK: - PersonDataModel
struct DataModel: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: Person
}

// MARK: - Person
struct Person: Codable {
    let name, profileMessage: String

    enum CodingKeys: String, CodingKey {
        case name
        case profileMessage = "profile_message"
    }
}
