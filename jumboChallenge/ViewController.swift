//
//  ViewController.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-15.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler, WKNavigationDelegate, UITableViewDataSource, UITableViewDelegate {
    //MARK: Properties
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var operationsTableView: UITableView!
    var opHandler = OperationsHandler()
    
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        operationsTableView.delegate = self
        operationsTableView.dataSource = self
    }
    
    // After view has loaded, with some delay, start some sample messages
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.2)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
        perform(#selector(startNewOperation), with: nil, afterDelay: 1.4)
    }
    
    
    func setupWebView() {
        webView.configuration.userContentController.add(self, name: "jumbo")
        // Loading HTML from bundle
        let url = Bundle.main.resourceURL!.absoluteURL
        let html = url.appendingPathComponent("index.html")
        webView.loadFileURL(html, allowingReadAccessTo: url)
    }
    
    
    // Register this class as a message handler being able to receive js messages with the schema
    // "jumbo"
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jumbo" {
            //call message handler to modify data model, based on message
            updateCell(index: opHandler.handleMessage(message: message.body), tableView: operationsTableView)
        }
    }
    
    //MARK: Setting Up Tableview
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
    
    
    //MARK: Custom Functions
  
    // Will create a new operation in the operation Handler's array and call
    // startOperation() JS function to start messages
    @objc func startNewOperation() {
        //generating a random string operation ID
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        // Getting indexPath returned from startOperation and using it to insert a new row
        // into the table
        let newIndexPath = opHandler.startOperation(id: id)
        operationsTableView.insertRows(at: [newIndexPath], with: .automatic)
        
        webView.evaluateJavaScript("startOperation('\(id)')", completionHandler: nil)
    }
    
    // func to specifically views in a cell, rather than reloading the entire cell
    func updateCell(index: Int, tableView: UITableView) {
        let indexPath = IndexPath(row: index, section:0)
        
        if let cell = tableView.cellForRow(at: indexPath) as? MessageProgressTableViewCell {
            cell.operationProgressView.setProgress(opHandler.operations[index].progress, animated: true)
            cell.operationStateLabel.text = opHandler.operations[index].state
        }
    }
}

