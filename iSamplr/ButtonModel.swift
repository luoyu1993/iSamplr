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
	* changeButtonSound changes the sound that is bound to the button in given index #.
	* @param index the index number to change the sound of
	* @soundFile the String of path to the sound file
	* @fileExtension the file extension of the sound file
	*/
	func changeButtonSound(index: Int, soundFile: NSURL, fileExtension: String) {
		players[index].setSound(soundFile, fileExtension: fileExtension)
	}
	
	private func addButtonToModel(button: UIButton) {
		players.append(playerButton(button: button))
	}
	
	private func addButtonToModel(button: UIButton, soundFile: String, fileExtension: String) {
		players.append(playerButton(button: button))
		players.last?.setSound(NSBundle.mainBundle().URLForResource(soundFile, withExtension: fileExtension)!, fileExtension: fileExtension)
	}
}