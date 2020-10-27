//
//  MainViewModel.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

protocol MainViewModelDelegate: AnyObject {
    func loadViewDataError(error: String)
    func viewDataLoaded()
}

class MainViewModel {
    var commitInfoList = [CommitInfo]()
    weak var delegate: MainViewModelDelegate?
    
    init() {
        loadCommitInfo()
    }
    
    public func reloadCommitInfo() {
        loadCommitInfo()
    }
    
    private func loadCommitInfo() {
        CommitService.shared.getCommits { [weak self] result in
            switch result {
            case .success(let commitInfoList):
                self?.commitInfoList = commitInfoList
                DispatchQueue.main.async {
                    self?.delegate?.viewDataLoaded()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.delegate?.loadViewDataError(error: "Could not load data. \(error.localizedDescription)")
                }
            }
        }
    }
}
