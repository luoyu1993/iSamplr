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
	* @param soundFile the NSURL of the sound file
	* @param fileExtension the file extension to that sound file
	*/
	func setSound(soundFile: NSURL, fileExtension: String) {
		do {
			try self.player = AVAudioPlayer(contentsOfURL: soundFile)
		} catch let error as NSError? {
			print(error.debugDescription)
		}
	}
	
}