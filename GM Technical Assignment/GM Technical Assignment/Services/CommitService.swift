//
//  CommitService.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

class CommitService {
    static let shared = CommitService()
    private let httpRequest = HTTPRequestHelper()
    
    /// Get list of commits from the Github repo
    /// - Parameter completion: The clousure that will be called with the Result object.
    func getCommits(completion: @escaping ((Result<[CommitInfo], Error>) -> Void)) {
        let commitsURL = "https://api.github.com/repos/cetorres/GM-Technical-Assignment/commits"
        httpRequest.sendRequest(commitsURL, completion: completion)
    }
}
