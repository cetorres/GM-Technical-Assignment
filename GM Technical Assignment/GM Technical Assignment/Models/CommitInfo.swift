//
//  CommitInfo.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

struct CommitInfo: Codable {
    let sha: String
    let commit: Commit

    enum CodingKeys: String, CodingKey {
        case sha, commit
    }
}
