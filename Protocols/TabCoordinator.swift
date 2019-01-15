//
//  TabCoordinator.swift
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

protocol TabCoordinator: Coordinator {
    var tabBarController: UITabBarController { get }
}

extension TabCoordinator {
    func stop() {
        tabBarController.setViewControllers([], animated: false)
    }
}

extension TabCoordinator {
    var selectedViewController: UIViewController? {
        return tabBarController.viewControllers?[tabBarController.selectedIndex]
    }
}

extension TabCoordinator {
    func selectTab<T: Coordinator>(type _: T.Type) {
        guard let index = childCoordinators.firstIndex(where: { coordinator in
            coordinator is T
        }) else {
            return
        }

        tabBarController.selectedIndex = index
    }
}

extension TabCoordinator {
    func present(alertController: UIAlertController) {
        tabBarController.present(alertController, animated: true)
    }

    func present(activityViewController: UIActivityViewController) {
        tabBarController.present(activityViewController, animated: true)
    }
}
