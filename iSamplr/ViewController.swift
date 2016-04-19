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
	let instance = ButtonModel.model
	var sound: SystemSoundID = 0
	
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
	
	private func setupButtons() {
		addButtonToModel(button11, soundFile: "Sounds/RSChordA1", fileExtension: "aif")
		addButtonToModel(button12, soundFile: "Sounds/RSChordA2", fileExtension: "aif")
		addButtonToModel(button13, soundFile: "Sounds/RSChordA3", fileExtension: "aif")
		addButtonToModel(button14, soundFile: "Sounds/RSChordA4", fileExtension: "aif")
		
		
		addButtonToModel(button21, soundFile: "Sounds/RSChordAbass1", fileExtension: "aif")
		addButtonToModel(button22, soundFile: "Sounds/RSChordAbass2", fileExtension: "aif")
		addButtonToModel(button23, soundFile: "Sounds/RSChordAbass3", fileExtension: "aif")
		addButtonToModel(button24, soundFile: "Sounds/RSChordAbass4", fileExtension: "aif")
		
		addButtonToModel(button31, soundFile: "Sounds/RShihat", fileExtension: "aif")
		addButtonToModel(button32, soundFile: "Sounds/RShihat", fileExtension: "aif")
		addButtonToModel(button33, soundFile: "Sounds/RShihat", fileExtension: "aif")
		addButtonToModel(button34, soundFile: "Sounds/RShihat", fileExtension: "aif")
		
		addButtonToModel(button41, soundFile: "Sounds/RShihat", fileExtension: "aif")
		addButtonToModel(button42, soundFile: "Sounds/RSKick", fileExtension: "aif")
		addButtonToModel(button43, soundFile: "Sounds/RSSnare", fileExtension: "aif")
		addButtonToModel(button44, soundFile: "Sounds/RShihat", fileExtension: "aif")
		
	}
	
	private func addButtonToModel(button: UIButton, soundFile: String, fileExtension: String) {
		instance.players[button.tag].setSound(soundFile, fileExtension: fileExtension)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		
		setupButtons()
		
	}
	
	override func awakeFromNib() {
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	
	@IBAction func buttonTap(sender: AnyObject) {
		
		instance.players[sender.tag].player.prepareToPlay()
		instance.players[sender.tag].player.play()

		if sender.state == UIGestureRecognizerState.Began {
			let alertController = UIAlertController(title: String(sender.tag), message:
				"Long-Press Gesture Detected", preferredStyle: UIAlertControllerStyle.Alert)
			alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default,handler: nil))
			
			self.presentViewController(alertController, animated: true, completion: nil)
		}

	}
	
	
}

