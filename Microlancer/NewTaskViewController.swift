//
//  NewTaskViewController.swift
//  Microlancer
//
//  Created by Samuel on 21/06/20.
//  Copyright © 2020 Microlancer. All rights reserved.
//

import UIKit
import WebKit

class NewTaskViewController: UIViewController, WKNavigationDelegate {
    
    
    
    var webView: WKWebView!
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 
        
        
        let alert = UIAlertController(title: "What do you want to create?", message: nil, preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "New Task", style: .default) { _ in
           let url = URL(string: "https://microlancer.io/task/new")!
            self.webView.load(URLRequest(url: url))
        })

        alert.addAction(UIAlertAction(title: "New Service", style: .default) { _ in
            let url = URL(string: "https://microlancer.io/service/new")!
            self.webView.load(URLRequest(url: url))
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
            self.navigationController?.popViewController(animated: true)

            self.dismiss(animated: true, completion: nil)
        })

        present(alert, animated: true)
        // 1

        
        // 2
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload))
        toolbarItems = [refresh]
        navigationController?.isToolbarHidden = false
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

    }

}

