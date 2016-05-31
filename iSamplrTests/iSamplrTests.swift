//
//  iSamplrTests.swift
//  iSamplrTests
//
//  Created by Hun Jae Lee on 4/3/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest
@testable import iSamplr

class iSamplrTests: XCTestCase {
	// still need a singleton pattern here when testing
	let instance = ButtonModel.model
	let soundFile1path = "Documents/hat"
	let soundFile1ext = "wav"
	let soundFile2path = "Documents/kick"
	let soundFile2ext = "wav"
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
	
    /*
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
	*/
	
	func test_ButtonModel_InstanceSetup() {
		XCTAssert(instance.players.count == 16)
	}
	
}
