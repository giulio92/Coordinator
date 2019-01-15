//
//  NavCoordinator.swift
//  Coordinator
//
//  Created by Giulio Lombardo on 15/01/2019.
//
//  MIT License
//
//  Copyright (c) 2019 Giulio Lombardo
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
//  IN THE SOFTWARE.
//

import UIKit

protocol NavCoordinator: Coordinator {
    var navigationController: UINavigationController { get }
}

extension NavCoordinator {
    func stop() {
        navigationController.setViewControllers([], animated: false)
    }
}

extension NavCoordinator {
    var topViewController: UIViewController? {
        return navigationController.topViewController
    }

    var presentedViewController: UIViewController? {
        return navigationController.presentedViewController
    }

    var visibleViewController: UIViewController? {
        return navigationController.visibleViewController
    }
}

extension NavCoordinator {
    func dismissCoordinator() {
        navigationController.dismiss(animated: true, completion: {
            self.parentCoordinator?.removeChildCoordinator(coordinator: self)
        })
    }
}

extension NavCoordinator {
    func popViewController() {
        navigationController.popViewController(animated: true)
    }
}

extension NavCoordinator {
    func dismissViewController() {
        navigationController.dismiss(animated: true)
    }
}

extension NavCoordinator {
    private var currentViewController: UIViewController {
        guard let currentViewController: UIViewController = visibleViewController else {
            return navigationController
        }

        return currentViewController
    }

    func present(alertController: UIAlertController) {
        currentViewController.present(alertController, animated: true)
    }

    func present(activityViewController: UIActivityViewController) {
        currentViewController.present(activityViewController, animated: true)
    }
}