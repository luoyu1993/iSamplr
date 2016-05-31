//
//  ViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/3/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPopoverPresentationControllerDelegate {
	
	// MARK: model setup
	let instance = ButtonModel.model
	
	// MARK: IBOutlet, storyboard stuff
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
	
	// MARK: overridden UIViewController functions
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		// this is for demo. comment out on release.
		setupSampleButtons()
		
		// this is for actual release. uncomment on release.
		// setupButtons()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	/// Recognizes the tap on the button and starts the timer.
	@IBAction func buttonTap(sender: UIButton) {
		// save current time
		instance.players[sender.tag].timer = NSDate()
		// print(String(sender.tag))	// debugging purposes
		
		// TODO: change color to highlight color
		sender.setImage(instance.players[sender.tag].tapImage, forState: .Normal)
	}
	
	/**
	Recognizes the release on the button and stops the timer.
	
	If the button was pressed and held for more than a second, show a menu.
	Otherwise, play the sound that it is bound to (if no sound, nothing is played).
	*/
	@IBAction func buttonRelease(sender: UIButton) {
		// TODO: change color back to normal state color
		sender.setImage(instance.players[sender.tag].restImage, forState: .Normal)
		
		let endTimer = NSDate()
		if endTimer.timeIntervalSinceDate(instance.players[sender.tag].timer) >= 1.0 {
			callSmartMenu(sender)
		} else {
			if let sf = instance.players[sender.tag].soundFile, fe = instance.players[sender.tag].fileExtension {
				instance.players[sender.tag].setSound(sf, fileExtension: fe)
				instance.players[sender.tag].player.prepareToPlay()
				instance.players[sender.tag].player.play()
			}
		}
	}
	
	/**
	* callSmartMenu calls UIAlert of the Smart Menu
	* @param sender the sound button
	*/
	private func callSmartMenu(sender: UIButton) {
		
		// make them
		let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .Alert)
		let recordSoundAction = UIAlertAction(title: "Record Sample", style: .Default) { action in self.performSegueWithIdentifier("showRecorder", sender: sender) }
		let changeSoundAction = UIAlertAction(title: "Load Sample", style: .Default) { action in self.performSegueWithIdentifier("showFiler", sender: sender) }
		let changeTapButtonAction = UIAlertAction(title: "Change Tap Color", style: .Default) {
			action in self.callChangeButtonColorMenu(sender, changingTappedStateImage: true)
		}
		let changeNormalButtonAction = UIAlertAction(title: "Change Idle Color", style: .Default) {
			action in self.callChangeButtonColorMenu(sender, changingTappedStateImage: false)
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
		
		// add them
		alertController.addAction(recordSoundAction)
		alertController.addAction(changeSoundAction)
		alertController.addAction(changeTapButtonAction)
		alertController.addAction(changeNormalButtonAction)
		alertController.addAction(cancelAction)
		
		// call them
		self.presentViewController(alertController, animated: true) {
			// nothing should happen in the back when an alert is displayed
		}
	}
	
	/**
	* callChangeButtonColorMenu shows UIAlert of button colors, and set them
	* @param sender: the sound button
	* @param changingTappedStateImage: whether we are changing the tap image or rest image
	*/
	private func callChangeButtonColorMenu(sender: UIButton, changingTappedStateImage: Bool) {
		// make them
		let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .Alert)
		let grayAction = UIAlertAction(title: "Gray", style: .Default) {
			action in self.changeButtonImage(sender, changingTappedStateImage: changingTappedStateImage, toColor: ButtonColor.Gray)
		}
		let redAction = UIAlertAction(title: "Red", style: .Default) {
			action in self.changeButtonImage(sender, changingTappedStateImage: changingTappedStateImage, toColor: ButtonColor.Red)
		}
		let blueAction = UIAlertAction(title: "Blue", style: .Default) {
			action in self.changeButtonImage(sender, changingTappedStateImage: changingTappedStateImage, toColor: ButtonColor.Blue)
		}
		let yellowAction = UIAlertAction(title: "Yellow", style: .Default) {
			action in self.changeButtonImage(sender, changingTappedStateImage: changingTappedStateImage, toColor: ButtonColor.Yellow)
		}
		let greenAction = UIAlertAction(title: "Green", style: .Default) {
			action in self.changeButtonImage(sender, changingTappedStateImage: changingTappedStateImage, toColor: ButtonColor.Green)
		}
		let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (_) in }
		
		// add them
		alertController.addAction(grayAction)
		alertController.addAction(redAction)
		alertController.addAction(blueAction)
		alertController.addAction(yellowAction)
		alertController.addAction(greenAction)
		alertController.addAction(cancelAction)
		
		// call them
		self.presentViewController(alertController, animated: true) {
			// nothing should happen in the back when an alert is displayed
		}

	}
	
	/**
	* changeButtonImage is called by callChangeButtonColorMenu(). It will change the color (= button image) of the given UIButton.
	* @param button the UIButton to change image of
	* @param changingTappedStateImage whether we are changing the tap image or rest image
	* @param toColor the color to change to (enum)
	*/
	private func changeButtonImage(button: UIButton, changingTappedStateImage: Bool, toColor: ButtonColor) {
		if changingTappedStateImage {
			instance.players[button.tag].tapImage = toColor.image()
		} else {
			button.setImage(toColor.image(), forState: .Normal)
			instance.players[button.tag].restImage = toColor.image()
		}
	}

	
	// MARK: initial/sample loadout setup
	
	/**
	* setupSampleButtons sets default sound setup. This is for loading sample sound loadout.
	* THIS IS FOR DEMO
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
		
		setButtonInModel(button31, soundFile: "Documents/hat", fileExtension: "wav")
		setButtonInModel(button32, soundFile: "Documents/kick", fileExtension: "wav")
		setButtonInModel(button33, soundFile: "Documents/snare", fileExtension: "wav")
		setButtonInModel(button34, soundFile: "Documents/clap", fileExtension: "wav")
		
		setButtonInModel(button41, soundFile: "Documents/RShihat", fileExtension: "aif")
		setButtonInModel(button42, soundFile: "Documents/RSKick", fileExtension: "aif")
		setButtonInModel(button43, soundFile: "Documents/RSSnare", fileExtension: "aif")
		setButtonInModel(button44, soundFile: "Documents/RShihat", fileExtension: "aif")
	}
	
	/**
	* setupSampleButtons sets default sound setup. This is for loading empty sound loadout.
	* THIS IS FOR ACTUAL PRODUCTION RELEASE
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
		instance.players[button.tag] = playerButton(button: button, soundFile: NSBundle.mainBundle().URLForResource(soundFile, withExtension: fileExtension)!, fileExtension: fileExtension)
	}
	
	/**
	* overridden setButtonInModel sets up the playerButton in the shared instance.
	* @param button the UIButton instance
	*/
	private func setButtonInModel(button: UIButton) {
		instance.players[button.tag] = playerButton(button: button)
	}

	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if (segue.identifier == "showRecorder") {
			let svc = segue.destinationViewController as! RecorderViewController
			svc.buttonTag = sender!.tag
		}
		else if (segue.identifier == "showFiler") {
			let svc = segue.destinationViewController as! SoundFileTableViewController
			svc.buttonTag = sender!.tag
		}
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
	}
	
	/**
	* unwinds segue to this view controller.
	* @param segue the storyboard segue
	*/
	@IBAction func unwindToVC(segue: UIStoryboardSegue) {

	}
}
