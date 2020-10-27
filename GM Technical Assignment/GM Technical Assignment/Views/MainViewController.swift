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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Commits"
        
        // Table view settings
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        
        // Set view model delegate
        viewModel.delegate = self
    }


}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MainViewController: MainViewModelDelegate {
    func loadViewDataError(error: String) {
        
    }
    
    func viewDataLoaded() {
        
    }
}
