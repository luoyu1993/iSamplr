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
	var restImage = UIImage(named: "button.png")
	var tapImage = UIImage(named: "button.png")
	var soundFile: String?
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
	
	init(button: UIButton, soundFile: String, fileExtension: String) {
		self.button = button
		self.soundFile = soundFile
		self.fileExtension = fileExtension
		setSound(soundFile, fileExtension: fileExtension)
	}
	
	func setSound(soundFile: String, fileExtension: String) {
		do {
			try self.player = AVAudioPlayer(contentsOfURL: NSBundle.mainBundle().URLForResource(soundFile, withExtension: fileExtension)!)
		} catch let error as NSError? {
			print(error.debugDescription)
		}
	}
	
	func setRestImage(imagePath: String) {
		// restImage = UIImage(named: imagePath)
		button!.setImage(UIImage(named: imagePath), forState: .Normal)
	}
	
	func setTapImage(imagePath: String) {
		// tapImage = UIImage(named: imagePath)
		button!.setImage(UIImage(named: imagePath), forState: .Selected)
		button!.setImage(UIImage(named: imagePath), forState: .Highlighted)
	}
	
	
}