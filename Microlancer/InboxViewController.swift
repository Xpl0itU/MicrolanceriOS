//
//  InboxViewController.swift
//  Microlancer
//
//  Created by Samuel on 21/06/20.
//  Copyright © 2020 Microlancer. All rights reserved.
//

import UIKit
import WebKit

class InboxViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1
        let url = URL(string: "https://microlancer.io/inbox")!
        webView.load(URLRequest(url: url))
        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }

}
