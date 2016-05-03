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
	* @param soundFile the String of path to the sound file
	* @param fileExtension the file extension of the sound file
	*/
	func changeButtonSound(index: Int, soundFile: NSURL, fileExtension: String) {
		players[index].setSound(soundFile, fileExtension: fileExtension)
	}
	
	/**
	* addButtonToModel adds the given UIButton to the model.
	* @param button the UIButton to insert into the model
	*/
	private func addButtonToModel(button: UIButton) {
		players.append(playerButton(button: button))
	}
	
	/**
	* addButtonToModel adds the given UIButton with sound bound to it into the model.
	* @param button the UIButton to insert into the model
	* @param soundFile the String of path to the sound file
	* @param fileExtension the file extension of the sound file
	*/
	private func addButtonToModel(button: UIButton, soundFile: String, fileExtension: String) {
		players.append(playerButton(button: button))
		players.last?.setSound(NSBundle.mainBundle().URLForResource(soundFile, withExtension: fileExtension)!, fileExtension: fileExtension)
	}
}