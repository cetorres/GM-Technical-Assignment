//
//  CommitInfo.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

class CommitInfo: Codable {
    let sha: String
    let commit: Commit

    enum CodingKeys: String, CodingKey {
        case sha, commit
    }

    init(sha: String, commit: Commit) {
        self.sha = sha
        self.commit = commit
    }
}
