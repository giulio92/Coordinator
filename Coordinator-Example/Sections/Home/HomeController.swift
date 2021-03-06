//
//  HomeController.swift
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

final class HomeController: UIViewController, ViewModelController {
	typealias ViewModelType = HomeViewModel

	var viewModel: ViewModelType!

	@IBOutlet private var detailButton: UIButton!

	@IBAction private func detailButtonAction(_: UIButton) {
		viewModel.showDetail()
	}

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

		if #available(iOS 9.0, *) {
			setup3DTouchInteraction()
		}
    }

	@available(iOS 9.0, *)
	private func setup3DTouchInteraction() {
		guard traitCollection.forceTouchCapability == .available else {
			return
		}

		registerForPreviewing(with: self, sourceView: detailButton)
	}
}

extension HomeController: UIViewControllerPreviewingDelegate {
	func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation _: CGPoint) -> UIViewController? {
		return viewModel.previewDetail()
	}

	func previewingContext(_: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
		viewModel.commitPreviewContext(viewController: viewControllerToCommit)
	}
}
