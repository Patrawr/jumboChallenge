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
    @IBOutlet weak var webView: WKWebView!
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "jumbo" {
            print(message.body)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView.configuration.userContentController.add(self, name: "jumbo")
        
        let url = Bundle.main.resourceURL!.absoluteURL
        let html = url.appendingPathComponent("index.html")
        
        webView.loadFileURL(html, allowingReadAccessTo: url)
        
        let greetingScript = "window.webkit.messageHandlers.jumbo.postMessage('Hello World')"
        webView.evaluateJavaScript(greetingScript, completionHandler: nil)
        
    }
}

