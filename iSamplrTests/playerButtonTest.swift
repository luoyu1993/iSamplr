//
//  playerButtonTest.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 5/31/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest
@testable import iSamplr

class playerButtonTest: XCTestCase {
	var buttonInstance = playerButton()
	let someUIButton = UIButton()
	let soundFile1path = "Documents/hat"
	let soundFile1ext = "wav"
	let soundFile2path = "Documents/kick"
	let soundFile2ext = "wav"
	let soundFileNonexistingPath = "Documents/not_a_sound_path"
    
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
	
	func test_init_noParam() {
		let newButton = playerButton()
		XCTAssert(newButton.soundFile == nil, "playerButton instantiation without any parameter should not have its soundFile")
		XCTAssertNil(newButton.soundFile)
	}
	
	func test_init_param_nominal() {
		let newButton = playerButton(button: someUIButton)
		XCTAssert(newButton.button === someUIButton, "playerButton instantiation with an arbitrary UIButton instance should properly keep that UIButton")
	}
	
	func test_setSound() {
		// NSURL:
		// NSBundle.mainBundle().URLForResource( <file path> , withExtension: <file extension>)!
		buttonInstance.setSound(NSBundle.mainBundle().URLForResource(soundFile1path, withExtension: soundFile1ext)!, fileExtension: soundFile1ext)
		
		XCTAssertTrue(buttonInstance.player.play(), "setSound should work properly")
	}

	/* this test does not throw, but rather gets a fatal error
	func test_setSound_failing() {
		XCTAssertThrowsError( 		buttonInstance.setSound(NSBundle.mainBundle().URLForResource(soundFileNonexistingPath, withExtension: soundFile1ext)!, fileExtension: soundFile2ext) )
	}
	*/
	
	
}
