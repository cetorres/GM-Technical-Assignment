//
//  ViewController.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = MainViewModel()
    let activityIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Commits"
        
        // Table view settings
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        // Table view refresh control
        let rc = UIRefreshControl()
        rc.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = rc
        
        // Initial activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.center = CGPoint(x: view.center.x, y: view.center.y)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        
        // Set view model delegate
        viewModel.delegate = self
    }

    @objc func refreshData() {
        viewModel.reloadCommitInfo()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commitInfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CommitInfoCell", for: indexPath) as! CommitInfoCell
        cell.selectionStyle = .none
        cell.setData(commitInfo: viewModel.commitInfoList[indexPath.row])
        return cell
    }
}

extension MainViewController: MainViewModelDelegate {
    func loadViewDataError(error: String) {
        self.activityIndicator.stopAnimating()
        self.tableView.refreshControl?.endRefreshing()
        showAlert(title: "Error", message: error)
    }
    
    func viewDataLoaded() {
        title = "Commits (\(viewModel.commitInfoList.count))"
        self.tableView.reloadData()
        self.tableView.refreshControl?.endRefreshing()
        self.activityIndicator.stopAnimating()
    }
}
