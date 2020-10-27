//
//  Commit.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

class Commit: Codable {
    let author: Author
    let message: String

    enum CodingKeys: String, CodingKey {
        case author, message
    }

    init(author: Author, message: String) {
        self.author = author
        self.message = message
    }
}
