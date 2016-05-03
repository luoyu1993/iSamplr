//
//  playerButton.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/18/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import Foundation
import AVFoundation
import UIKit

class playerButton {
	var restImage = UIImage(named: "Images/button.png")
	var tapImage = UIImage(named: "Images/button.png")
	var soundFile: NSURL?
	var fileExtension: String?
	var player = AVAudioPlayer()
	var button: UIButton?
	var timer = NSDate()

	// creates an empty instance
	init() {
	}

	// creates an instance with button
	init(button: UIButton) {
		self.button = button
	}
	
	// creates an instance with button and its sound
	init(button: UIButton, soundFile: NSURL, fileExtension: String) {
		self.button = button
		self.soundFile = soundFile
		self.fileExtension = fileExtension
		setSound(soundFile, fileExtension: fileExtension)
	}

	/**
	* setSound sets this button's sound
	* @param soundFile the
	* @param 
	*/
	func setSound(soundFile: NSURL, fileExtension: String) {
		do {
			try self.player = AVAudioPlayer(contentsOfURL: soundFile)
		} catch let error as NSError? {
			print(error.debugDescription)
		}
	}
	
	func setRestImage(image: UIImage) {
		restImage = image
	}
	
	func setTapImage(image: UIImage) {
		tapImage = image
	}
	
	
}


// ButtonColor enum represents which button color to use when changing button color
enum ButtonColor : Int {
	case Gray = 0, Red, Blue, Green, Yellow
	
	// returns a simple description of this ButtonColor enum
	func simpleDescription() -> String {
		switch self {
		case .Gray:
			return "gray"
		case .Red:
			return "red"
		case .Blue:
			return "blue"
		case .Green:
			return "green"
		case .Yellow:
			return "yellow"
		}
	}
	
	// returns the UIImage of each "colored" button image.
	func image() -> UIImage {
		switch self {
		case .Gray:
			return UIImage(named: "Images/button.png")!
		case .Red:
			return UIImage(named: "Images/button_red.png")!
		case .Blue:
			return UIImage(named: "Images/button_blue.png")!
		case .Green:
			return UIImage(named: "Images/button_green.png")!
		case .Yellow:
			return UIImage(named: "Images/button_yellow.png")!
		}
	}
}