//
//  CommitService.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

class CommitService {
    static let shared = CommitService()
    private let httpRequest = HTTPRequestHelper<CommitInfo>()
    
    func getCommits(completion: @escaping ((Result<[CommitInfo], Error>) -> Void)) {
        let commitsURL = "https://api.github.com/repos/cetorres/gm_technical_assignment/commits"
        httpRequest.sendRequest(commitsURL, parameters: [:], completion: completion)
    }
}
