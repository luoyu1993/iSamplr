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
	
	init() {
		// creates an empty instance
	}
	
	init(button: UIButton) {
		self.button = button
	}
	
	init(button: UIButton, soundFile: NSURL, fileExtension: String) {
		self.button = button
		self.soundFile = soundFile
		self.fileExtension = fileExtension
//		setSound(NSBundle.mainBundle().URLForResource(soundFile, withExtension: fileExtension)!, fileExtension: fileExtension)
		setSound(soundFile, fileExtension: fileExtension)
	}
	
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

enum ButtonColor : Int {
	case Gray = 0, Red, Blue, Green, Yellow
	
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