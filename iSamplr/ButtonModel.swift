//
//  ButtonModel.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/17/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import Foundation

class ButtonModel {
	static let model = ButtonModel()
	var players: [playerButton]
	
	init() {
		players = [playerButton](count: 16, repeatedValue: playerButton())
	}
	
	/**
	Changes the sound that is bound to the button in given index #.
	- Parameters:
		- index: the index number to change the sound of
		- soundFile: the `NSURL` to the sound file to change into
		- fileExtension: the file extension of the sound file
	- Returns: whether the change was successful
	*/
	func changeButtonSound(index: Int, soundFile: NSURL, fileExtension: String) -> Bool {
		if 0 <= index && index <= 16 {
			players[index].setSound(soundFile, fileExtension: fileExtension)
			return true
		} else {
			return false
		}
	}
}