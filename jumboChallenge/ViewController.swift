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
    
    
    var operations = [Operation]()
    
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        operationsTableView.delegate = self
        operationsTableView.dataSource = self
        loadSampleOperations()
    }
    
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jumbo" {
            print(message.body)
        }
    }
    
    //MARK: Setting Up Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Linking to identifier in message table cell
        let cellIdentifier = "MessageProgressTableViewCell"
        
        // Handles dequeuing in table view
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MessageProgressTableViewCell else {
                fatalError("The dequed instance is not of type MessageProgressTableViewCell")
        }
        
        // Fetches the appropriate operation to update the cell with
        let operation = operations[indexPath.row]
        cell.messageNameLabel.text = operation.name
        cell.operationProgressView.progress = operation.progress
        cell.operationStateLabel.text = operation.state
        
        
        return cell
    }
    
    func loadSampleOperations() {
        guard let sampleOperation = Operation(name: "abc", progress: 0.5, state: "in progress") else {
            fatalError("Unable to instantiate sample operations")
        }
        
        let newIndexPath = IndexPath(row: operations.count, section: 0)
        operations.append(sampleOperation)
        operationsTableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    //MARK: Custom Functions
    func setupWebView() {
        webView.configuration.userContentController.add(self, name: "jumbo")
        // Loading HTML from bundle
        let url = Bundle.main.resourceURL!.absoluteURL
        let html = url.appendingPathComponent("index.html")
        webView.loadFileURL(html, allowingReadAccessTo: url)
    }
    
    
    //MARK: Action Methods
    @IBAction func jsTriggerTest(_ sender: UIButton) {
        webView.evaluateJavaScript("startOperation('abc')", completionHandler: nil)
        
        var updateRow = 0
        operations[updateRow].progress += 0.1
        operationsTableView.reloadRows(at: [IndexPath(row: updateRow, section: 0)], with: .automatic )
    }
    
    
}

