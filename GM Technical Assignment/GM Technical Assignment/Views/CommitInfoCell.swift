//
//  CommitInfoCell.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import UIKit

class CommitInfoCell: UITableViewCell {
    
    static let identifier = "CommitInfoCell"
    
    @IBOutlet weak var txtAuthorName: UILabel!
    @IBOutlet weak var txtCommitHash: UILabel!
    @IBOutlet weak var txtCommitMessage: UILabel!
    @IBOutlet weak var txtDate: UILabel!

    // Set the data of the cell from the MainViewData object
    func setData(viewData: MainViewData) {
        txtAuthorName.text = viewData.author
        txtCommitHash.text = viewData.hash
        txtCommitMessage.text = viewData.message
        txtDate.text = viewData.date
    }

}
