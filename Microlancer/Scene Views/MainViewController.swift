//
//  MainViewController.swift
//  Microlancer
//
//  Created by CypherPoet on 7/3/20.
//  Copyright © 2020 Microlancer. All rights reserved.
//


import UIKit
import SafariServices


final class MainViewController: UIViewController {

    lazy var safariViewControllerConfig: SFSafariViewController.Configuration = {
        let config = SFSafariViewController.Configuration()

        config.entersReaderIfAvailable = true

        return config
    }()
}


// MARK: - Lifecycle
extension MainViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presentSafariViewController()
    }
}


// MARK: - Private Helpers
private extension MainViewController {

    func presentSafariViewController() {
        guard let url = URL(string: "https://microlancer.io") else {
            preconditionFailure("Failed to make URL for Safari.")
        }

        let safariViewController = SFSafariViewController(url: url, configuration: safariViewControllerConfig)
        safariViewController.delegate = self

        present(safariViewController, animated: true)
    }
}


// MARK: - SFSafariViewControllerDelegate
extension MainViewController: SFSafariViewControllerDelegate {

    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: true)
    }
}
