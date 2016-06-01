//
//  ButtonModelTests.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 6/1/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import XCTest
@testable import iSamplr

class ButtonModelTests: XCTestCase {
	let instance = ButtonModel.model
	
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
	
	func test_changeButtonSound_nominal() {
		let s = NSBundle.mainBundle().URLForResource(soundFile1path, withExtension: soundFile1ext)
		let check = instance.changeButtonSound(0, soundFile: s!, fileExtension: "wav")
		
		XCTAssertTrue(check)
	}

	func test_changeButtonSound_error() {
		let s = NSBundle.mainBundle().URLForResource(soundFile1path, withExtension: soundFile1ext)
		let check = instance.changeButtonSound(-1, soundFile: s!, fileExtension: "wav")
		
		XCTAssertFalse(check)
	}
	
}
