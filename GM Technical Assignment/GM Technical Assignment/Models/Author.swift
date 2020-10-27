//
//  Author.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

class Author: Codable {
    let name: String
    let email: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case name, email, date
    }

    init(name: String, email: String, date: String) {
        self.name = name
        self.email = email
        self.date = date
    }
}
