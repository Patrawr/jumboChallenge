//
//  MessageProgressTableViewCell.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-18.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import UIKit

class MessageProgressTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var messageNameLabel: UILabel!
    @IBOutlet weak var operationProgressView: UIProgressView!
    @IBOutlet weak var operationStateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
