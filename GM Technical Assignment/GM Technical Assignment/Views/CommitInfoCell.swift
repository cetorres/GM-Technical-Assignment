//
//  CommitInfoCell.swift
//  GM Technical Assignment
//
//  Created by Carlos Torres on 10/26/20.
//

import UIKit

class CommitInfoCell: UITableViewCell {

    @IBOutlet weak var txtAuthorName: UILabel!
    @IBOutlet weak var txtCommitHash: UILabel!
    @IBOutlet weak var txtCommitMessage: UILabel!

    // Set the data of the cell from the CommitInfo object
    func setData(commitInfo: CommitInfo) {
        txtAuthorName.text = commitInfo.commit.author.name
        txtCommitHash.text = commitInfo.sha
        txtCommitMessage.text = commitInfo.commit.message
    }

}
