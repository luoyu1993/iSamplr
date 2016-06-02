//
//  SoundFileTableViewTests.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 6/1/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest

class SoundFileTableViewTests: XCTestCase {
	let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
		

		app.launch()
		app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Other).element.childrenMatchingType(.Other).elementBoundByIndex(1).childrenMatchingType(.Other).elementBoundByIndex(0).childrenMatchingType(.Button).matchingIdentifier("button").elementBoundByIndex(0).pressForDuration(2.0);
		
		let collectionViewsQuery = app.alerts.collectionViews
		let loadSampleButton = collectionViewsQuery.buttons["Load Sample"]
		delay(3.0) {
			loadSampleButton.tap()
		}
		app.tap()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_preview_sound() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
		
		let tablesQuery = XCUIApplication().tables
		delay(3.0) {
			tablesQuery.staticTexts["iSamplr-REC_2016-05-31_144018"].tap()
		}
		app.tap()
    }
	
	
	private func delay(delay:Double, closure:()->()) {
		dispatch_after(
			dispatch_time(
				DISPATCH_TIME_NOW,
				Int64(delay * Double(NSEC_PER_SEC))
			),
			dispatch_get_main_queue(), closure)
	}

}
