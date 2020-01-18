//
//  BaseViewController.swift
//  Item Lister
//
//  Created by Cemil Kocaman on 18.01.2020.
//  Copyright © 2020 Cemil Kocaman Software. All rights reserved.
//

import Lottie
import UIKit

class BaseViewController: UIViewController {

    // MARK: - Properties

    private var loadingAnimationView = AnimationView(name: "loading")

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViews()
    }
}

// MARK: Configure Views

private extension BaseViewController {

    func configureViews() {
        loadingAnimationView.backgroundColor = .white
        loadingAnimationView.loopMode = .loop
    }
}

// MARK: Alert

extension BaseViewController {

    /// Show alert controller with given title and message and default action button
    /// - Parameters:
    ///   - title: Title for alert controller
    ///   - message: Message for alert controller
    func showAlert(withTitle title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: "general_alert_done_button_label".localized,
                                                style: .default,
                                                handler: nil))

        present(alertController, animated: true, completion: nil)
    }
}

// MARK: Loading Animation

extension BaseViewController {

    /// Shows loading animation
    func showLoading() {
        loadingAnimationView.frame = view.frame
        view.addSubview(loadingAnimationView)
        loadingAnimationView.play()
    }

    /// Hides loading animation
    func hideLoading() {
        loadingAnimationView.removeFromSuperview()
        loadingAnimationView.stop()
    }
}
