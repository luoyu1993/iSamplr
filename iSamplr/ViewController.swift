//
//  ViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/3/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
	
	// MARK: model setup
	let instance = ButtonModel.model
	
	// MARK: IBOutlet, storyboard stuff
	@IBOutlet var tapAndHoldGestureRecognizer: UILongPressGestureRecognizer!
	@IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
	
	@IBOutlet var button11: UIButton!
	@IBOutlet var button12: UIButton!
	@IBOutlet var button13: UIButton!
	@IBOutlet var button14: UIButton!
	
	@IBOutlet var button21: UIButton!
	@IBOutlet var button22: UIButton!
	@IBOutlet var button23: UIButton!
	@IBOutlet var button24: UIButton!
	
	@IBOutlet var button31: UIButton!
	@IBOutlet var button32: UIButton!
	@IBOutlet var button33: UIButton!
	@IBOutlet var button34: UIButton!
	
	@IBOutlet var button41: UIButton!
	@IBOutlet var button42: UIButton!
	@IBOutlet var button43: UIButton!
	@IBOutlet var button44: UIButton!
	
	// the overlay smart menu view when the user press+holds a button for >1 sec
	lazy var smartMenuView: SmartMenuView = {
		let v = SmartMenuView()
		return v
	}()
	
	// MARK: overridden UIViewController functions
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		setupSampleButtons()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: IBAction
	
	/**
	* buttonTap recognizes the tap on the button and starts the timer.
	*/
	@IBAction func buttonTap(sender: AnyObject) {
		// save current time
		instance.players[sender.tag].timer = NSDate()
	}
	
	/**
	* buttonRelease recognizes the release on the button and stops the timer.
	* if the button was pressed and held for more than a second,
	*	show a menu.
	* otherwise play the sound that it is bound to (if no sound, no play).
	*/
	@IBAction func buttonRelease(sender: UIButton) {
		let endTimer = NSDate()
		print("button release, timer end, time difference is: " + String(endTimer.timeIntervalSinceDate(instance.players[sender.tag].timer)))	
		if endTimer.timeIntervalSinceDate(instance.players[sender.tag].timer) >= 1.0 {
			// calls the smart menu
			smartMenuView.displayView(self.view, onButton: sender)
		} else {
			// dirty trik
			if let sf = instance.players[sender.tag].soundFile, fe = instance.players[sender.tag].fileExtension {
				instance.players[sender.tag].setSound(sf, fileExtension: fe)
				instance.players[sender.tag].player.prepareToPlay()
				instance.players[sender.tag].player.play()
			}
		}
	}
	
	
	// MARK: initial/sample loadout setup
	
	/**
	* setupSampleButtons sets default sound setup. This is for loading sample sound loadout.
	*/
	private func setupSampleButtons() {
		setButtonInModel(button11, soundFile: "Sounds/RSChordA1", fileExtension: "aif")
		setButtonInModel(button12, soundFile: "Sounds/RSChordA2", fileExtension: "aif")
		setButtonInModel(button13, soundFile: "Sounds/RSChordA3", fileExtension: "aif")
		setButtonInModel(button14, soundFile: "Sounds/RSChordA4", fileExtension: "aif")
		
		setButtonInModel(button21, soundFile: "Sounds/RSChordAbass1", fileExtension: "aif")
		setButtonInModel(button22, soundFile: "Sounds/RSChordAbass2", fileExtension: "aif")
		setButtonInModel(button23, soundFile: "Sounds/RSChordAbass3", fileExtension: "aif")
		setButtonInModel(button24, soundFile: "Sounds/RSChordAbass4", fileExtension: "aif")
		
		setButtonInModel(button31, soundFile: "Sounds/RShihat", fileExtension: "aif")
		setButtonInModel(button32, soundFile: "Sounds/RShihat", fileExtension: "aif")
		setButtonInModel(button33, soundFile: "Sounds/RShihat", fileExtension: "aif")
		setButtonInModel(button34, soundFile: "Sounds/RShihat", fileExtension: "aif")
		
		setButtonInModel(button41, soundFile: "Sounds/RShihat", fileExtension: "aif")
		setButtonInModel(button42, soundFile: "Sounds/RSKick", fileExtension: "aif")
		setButtonInModel(button43, soundFile: "Sounds/RSSnare", fileExtension: "aif")
		setButtonInModel(button44, soundFile: "Sounds/RShihat", fileExtension: "aif")
	}
	
	/**
	* setupSampleButtons sets default sound setup. This is for loading empty sound loadout.
	*/
	private func setupButtons() {
		setButtonInModel(button11)
		setButtonInModel(button12)
		setButtonInModel(button13)
		setButtonInModel(button14)
		
		setButtonInModel(button21)
		setButtonInModel(button22)
		setButtonInModel(button23)
		setButtonInModel(button24)
		
		setButtonInModel(button31)
		setButtonInModel(button32)
		setButtonInModel(button33)
		setButtonInModel(button34)
		
		setButtonInModel(button41)
		setButtonInModel(button42)
		setButtonInModel(button43)
		setButtonInModel(button44)
	}
	
	/**
	* setButtonInModel sets up the playerButton in the shared instance.
	* @param button the UIButton instance
	* @param soundFile the String of path to the sound file ("Sounds/something")
	* @param fileExtension the String of sound file's file extension ("wav")
	*/
	private func setButtonInModel(button: UIButton, soundFile: String, fileExtension: String) {
		instance.players[button.tag] = playerButton(button: button, soundFile: soundFile, fileExtension: fileExtension)
	}
	
	// override
	private func setButtonInModel(button: UIButton) {
		instance.players[button.tag] = playerButton(button: button)
	}

	
	
}

