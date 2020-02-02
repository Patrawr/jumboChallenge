//
//  WKDelegate.swift
//  jumboChallenge
//
//  Created by Patrick Wawrzoszek on 2020-02-02.
//  Copyright © 2020 Patrick Wawrzoszek. All rights reserved.
//

import WebKit

extension ViewController: WKNavigationDelegate {
    func setupWebView() {
        webView.configuration.userContentController.add(self, name: "jumbo")
        
        // Loading HTML from bundle
        let url = Bundle.main.resourceURL!.absoluteURL
        let html = url.appendingPathComponent("index.html")
        webView.loadFileURL(html, allowingReadAccessTo: url)
    }
    
    //called after webview finishes loading, will trigger off messages to start
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        for _ in 0..<300 {
            startNewOperation()
        }
    }
}
