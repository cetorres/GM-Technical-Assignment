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

struct MainViewData {
    let author: String
    let hash: String
    let message: String
    let date: String
}

class MainViewModel {
    var viewDataList = [MainViewData]()
    weak var delegate: MainViewModelDelegate?
    
    init() {
        loadViewData()
    }
    
    public func reloadViewData() {
        loadViewData()
    }
    
    private func loadViewData() {
        CommitService.shared.getCommits { [weak self] result in
            switch result {
            case .success(let commitInfoList):
                // Set the view data
                self?.createViewData(commitInfoList: commitInfoList)
                
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
    
    private func createViewData(commitInfoList: [CommitInfo]) {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let now = Date()
        for item in commitInfoList {
            let date = dateFormatter.date(from:item.commit.author.date)!
            var dateString = ""
            if date.hasSame(.day, as: now) {
                dateString = date.shortTime
            }
            else {
                dateString = date.shortDate
            }
            viewDataList.append(MainViewData(author: item.commit.author.name, hash: item.sha, message: item.commit.message, date: dateString))
        }
    }
}
