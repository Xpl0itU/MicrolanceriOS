//
//  MyTabBarController.swift
//  Microlancer
//
//  Created by Samuel on 21/06/2020.
//  Copyright © 2020 Microlancer. All rights reserved.
//

import UIKit
import WebKit

class MyTabBarController: UITabBarController, UITabBarControllerDelegate {

    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        webView.navigationDelegate = self as? WKNavigationDelegate
        view = webView
        // tell our UITabBarController subclass to handle its own delegate methods
        self.delegate = self
    }

    // called whenever a tab button is tapped
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if viewController is ProfileViewController {

        }

        if viewController is NewTaskViewController {
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
        }
        }
    }

    // alternate method if you need the tab bar item
func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        // ...
    }

