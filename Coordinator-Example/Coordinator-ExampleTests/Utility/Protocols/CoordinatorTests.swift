//
//  CoordinatorTests.swift
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

@testable import Coordinator_Example

import XCTest

final class CoordinatorTests: XCTestCase {
	typealias CoordinatorType = MainCoordinator

	var coordinator: CoordinatorType!

	override func setUp() {
		super.setUp()
		// Put setup code here. This method is called before the invocation of
		// each test method in the class.

		coordinator = CoordinatorType(navigationController: UINavigationController())
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of
		// each test method in the class.
		super.tearDown()

		coordinator = nil
	}

	func testCoordinatorCreation() {
		XCTAssertTrue(coordinator.navigationController.viewControllers.isEmpty)
		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testCoordinatorPushViewController() {
		coordinator.showWelcomePage()

		XCTAssertFalse(coordinator.navigationController.viewControllers.isEmpty)
	}

	func testCoordinatorPopViewController() {
		coordinator.showWelcomePage()
		coordinator.showWelcomePage()

		XCTAssertEqual(coordinator.navigationController.viewControllers.count, 2)

		coordinator.popViewController()

		waitForUIKitNavigationAnimation(completion: {
			XCTAssertEqual(self.coordinator.navigationController.viewControllers.count, 1)
			XCTAssertTrue(self.coordinator.navigationController.viewControllers.first is WelcomePageController)
		})
	}

	func testTopViewController() {
		coordinator.showWelcomePage()

		XCTAssertTrue(coordinator.topViewController is WelcomePageController)
	}

	func testAddChildCoordinator() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)
		
		XCTAssertFalse(coordinator.childCoordinators.isEmpty)
	}

	func testRemoveChildCoordinator() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.childCoordinators.count, 1)

		coordinator.removeChildCoordinator(coordinator: childCoordinator)

		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testRemoveAllChildCoordinators() {
		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)
		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.childCoordinators.count, 2)

		coordinator.removeAllChildCoordinators()

		XCTAssertTrue(coordinator.childCoordinators.isEmpty)
	}

	func testCoordinatorStop() {
		coordinator.showWelcomePage()

		let childCoordinator: CoordinatorType = CoordinatorType(navigationController: UINavigationController())

		coordinator.addChildCoordinator(coordinator: childCoordinator)

		XCTAssertEqual(coordinator.navigationController.viewControllers.count, 1)

		coordinator.stop()

		XCTAssertTrue(coordinator.navigationController.viewControllers.isEmpty)
		XCTAssertFalse(coordinator.childCoordinators.isEmpty)
	}
}
