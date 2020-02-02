//
//  ViewController.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-01-15.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKScriptMessageHandler {
    //MARK: Properties
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var operationsTableView: UITableView!
    var opHandler = OperationsHandler()
    // Queue setup to handle messages, separate from UI thread
    let messageQueue = DispatchQueue(label: "messageQueue")
    
    
    //MARK: Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupWebView()
        webView.navigationDelegate = self
        operationsTableView.delegate = self
        operationsTableView.dataSource = self
    }
    
    
    // Register this class as a message handler being able to receive js messages with the schema
    // "jumbo"
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jumbo" {
            let messageBody = message.body
            
            // pass messages to bakcground queue to handle processing, freeing up UI
            messageQueue.async {
                //call message handler to modify data model, based on message
                let newIndex = self.opHandler.handleMessage(message: messageBody)
                
                DispatchQueue.main.async {
                    self.updateCell(index: newIndex, tableView: self.operationsTableView)
                }
            }
        }
    }
    
    
    //MARK: Custom Functions
    // Will create a new operation in the operation Handler's array and call
    // startOperation() JS function to start messages
    @objc func startNewOperation() {
        //generating a random string operation ID
        var id = String(Int.random(in: 0..<1000000))
        id = id + "jmb"
        
        // Getting index returned from startOperation and using it to generate a new indexPath and insert a new row
        // into the table
        let newIndexPath = IndexPath(row: opHandler.startOperation(id: id), section: 0)
        operationsTableView.insertRows(at: [newIndexPath], with: .automatic)
        
        webView.evaluateJavaScript("startOperation('\(id)')", completionHandler: nil)
    }
}
