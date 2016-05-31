//
//  MainViewControllerTests.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 5/31/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest

class MainViewControllerTests: XCTestCase {
	let app = XCUIApplication()
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

	/// when launched, the main view should only have 16 buttons.
    func testProperLaunch() {
    	XCTAssert(app.buttons.count == 16)
    }
	
	func testTappingAButton() {
		
	}
}
