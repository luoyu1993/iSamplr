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
	/// the resting image of this `playerButton` instance.
	var restImage = UIImage(named: "Images/button.png")
	
	/// the tapped ("Highlighted") image of this `playerButton` instance.
	var tapImage = UIImage(named: "Images/button.png")
	
	/// the sound file that is bound to this `playerButton`
	var soundFile: NSURL?
	
	/// the file extension, in String format, of `soundFile` of this `playerButton`
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
	
	/**
	creates an instance with given `UIButton` and its `soundFile` to bind.
	- Parameters:
		- button: the `UIButton` that is bound to this `playerButton`
		- soundFile: the sound file that is bound to this `playerButton`
		- fileExtension: the file extension, in String format, of `soundFile` of this `playerButton`
	*/
	init(button: UIButton, soundFile: NSURL, fileExtension: String) {
		self.button = button
		self.soundFile = soundFile
		self.fileExtension = fileExtension
		setSound(soundFile, fileExtension: fileExtension)
	}

	/**
	Sets this `playerButton`'s sound.
	- Parameters:
		- soundFile: the `NSURL` of the sound file
		- fileExtension: the file extension to that sound file
	*/
	func setSound(soundFile: NSURL, fileExtension: String) {
		do {
			try self.player = AVAudioPlayer(contentsOfURL: soundFile)
		} catch let error as NSError? {
			// Instantiating AVAudioPlayer enforces exception handling
			print(error.debugDescription)
		}
	}
	
}