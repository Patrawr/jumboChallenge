//
//  TableViewDelegate.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-02-02.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import UIKit

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opHandler.operations.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Linking to identifier in message table cell
        let cellIdentifier = "MessageProgressTableViewCell"
        
        // Handles dequeuing in table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MessageProgressTableViewCell else {
                fatalError("The dequed instance is not of type MessageProgressTableViewCell")
        }
        
        // Fetches the appropriate operation to update the cell with
        let operation = opHandler.operations[indexPath.row]
        cell.messageNameLabel.text = "Message: \(operation.name)"
        cell.operationProgressView.progress = operation.progress
        cell.operationStateLabel.text = operation.state
        
        
        return cell
    }
    
    // func to specifically update views in a cell, rather than reloading the entire cell
    func updateCell(index: Int, tableView: UITableView) {
        let indexPath = IndexPath(row: index, section:0)
        
        if let cell = tableView.cellForRow(at: indexPath) as? MessageProgressTableViewCell {
            cell.operationProgressView.setProgress(opHandler.operations[index].progress, animated: true)
            cell.operationStateLabel.text = opHandler.operations[index].state
        }
    }
}
