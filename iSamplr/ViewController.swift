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
	var sound: SystemSoundID = 0
	
	@IBOutlet var button11: UIButton!
	@IBOutlet var button12: UIButton!
	@IBOutlet var button13: UIButton!
	@IBOutlet var button14: UIButton!
	@IBOutlet var button21: UIButton!
	@IBOutlet var button22: UIButton!
	@IBOutlet var button23: UIButton!
	@IBOutlet var button24: UIButton!
	
	var buttons = [UIButton]()

	
	let kickSoundURL = NSBundle.mainBundle().URLForResource("kick", withExtension: "wav")!
	let hatSoundURL = NSBundle.mainBundle().URLForResource("hat", withExtension: "wav")!
	let snareSoundURL = NSBundle.mainBundle().URLForResource("snare", withExtension: "wav")!
	let clapSoundURL = NSBundle.mainBundle().URLForResource("clap", withExtension: "wav")!
	let synthSoundURL = NSBundle.mainBundle().URLForResource("synth", withExtension: "m4a")!
	
	var kickPlayer = AVAudioPlayer()
	var snarePlayer = AVAudioPlayer()
	var clapPlayer = AVAudioPlayer()
	var hatPlayer = AVAudioPlayer()
	var synthPlayer = AVAudioPlayer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
	}
	
	override func awakeFromNib() {
//		buttons.append(self.view.viewWithTag(11) as! UIButton)

		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func playSynth() {
		do {
			try synthPlayer = AVAudioPlayer(contentsOfURL: synthSoundURL)
		} catch {
			
		}
		synthPlayer.prepareToPlay()
		synthPlayer.play()
	}
	
	func playKick() {
		do {
			try kickPlayer = AVAudioPlayer(contentsOfURL: kickSoundURL)
		} catch {
			// don't bind the sound to the player
		}
		
		kickPlayer.prepareToPlay()
		kickPlayer.play()
	}
	
	func playSnare() {
		do {
			try snarePlayer = AVAudioPlayer(contentsOfURL: snareSoundURL)
		} catch {
			// don't bind the sound to the player
		}
		
		snarePlayer.prepareToPlay()
		snarePlayer.play()
	}
	
	func playHat() {
		do {
			try hatPlayer = AVAudioPlayer(contentsOfURL: hatSoundURL)
		} catch {
			// don't bind the sound to the player
		}
		
		hatPlayer.prepareToPlay()
		hatPlayer.play()
	}
	
	func playClap() {
		do {
			try clapPlayer = AVAudioPlayer(contentsOfURL: clapSoundURL)
		} catch {
			// don't bind the sound to the player
		}
		
		clapPlayer.prepareToPlay()
		clapPlayer.play()
	}

	@IBAction func button11tap(sender: UIButton) {
		playClap()
	}
	
	@IBAction func button12tap(sender: UIButton) {
		playSynth()
	}
	
	@IBAction func button13tap(sender: UIButton) {
		playSnare()
	}
	
	@IBAction func button14tap(sender: UIButton) {
		
	}
	
	@IBAction func button21tap(sender: UIButton) {
		playHat()
	}
	
	
	@IBAction func button22tap(sender: UIButton) {
	}
	
	@IBAction func button23tap(sender: UIButton) {
		playKick()
	}
	
	
	@IBAction func button24tap(sender: UIButton) {
	}
	
	
	
	
}

