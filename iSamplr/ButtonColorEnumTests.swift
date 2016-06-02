//
//  ButtonColorEnumTests.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 6/1/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest
@testable import iSamplr

class ButtonColorEnumTests: XCTestCase {
	let grayColor = ButtonColor.Gray
	let redColor = ButtonColor.Red
	let greenColor = ButtonColor.Green
	let yellowColor = ButtonColor.Yellow
	let blueColor = ButtonColor.Blue
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
		
	}
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
	func test_simpleDescriptions() {
		XCTAssertEqual(grayColor.simpleDescription(), "gray")
		XCTAssertEqual(redColor.simpleDescription(), "red")
		XCTAssertEqual(greenColor.simpleDescription(), "green")
		XCTAssertEqual(blueColor.simpleDescription(), "blue")
		XCTAssertEqual(yellowColor.simpleDescription(), "yellow")
	}
	
	func test_image() {
		XCTAssertEqual(grayColor.image(), UIImage(named: "Images/button.png")!)
		XCTAssertEqual(redColor.image(), UIImage(named: "Images/button_red.png")!)
		XCTAssertEqual(greenColor.image(), UIImage(named: "Images/button_green.png")!)
		XCTAssertEqual(blueColor.image(), UIImage(named: "Images/button_blue.png")!)
		XCTAssertEqual(yellowColor.image(), UIImage(named: "Images/button_yellow.png")!)
	}
}
