//
//  Commit.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

struct Commit: Codable {
    let author: Author
    let message: String

    enum CodingKeys: String, CodingKey {
        case author, message
    }
}
