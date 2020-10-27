//
//  MainViewModel.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import Foundation

/// The view model delegate that is used to communicate data between
/// the view model class and the view (MainViewController) class.
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
                // Set the list of commits
                self?.commitInfoList = commitInfoList
                // Call the delegate method to update the UI on the view main thread.
                DispatchQueue.main.async {
                    self?.delegate?.viewDataLoaded()
                }
            case .failure(let error):
                // Call the delegate method to show an error message on the UI on the view main thread.
                DispatchQueue.main.async {
                    self?.delegate?.loadViewDataError(error: "Could not load data. \(error.localizedDescription)")
                }
            }
        }
    }
}
