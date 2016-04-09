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
	
	@IBOutlet var button31: UIButton!
	@IBOutlet var button32: UIButton!
	@IBOutlet var button33: UIButton!
	@IBOutlet var button34: UIButton!
	
	@IBOutlet var button41: UIButton!
	@IBOutlet var button42: UIButton!
	@IBOutlet var button43: UIButton!
	@IBOutlet var button44: UIButton!
	
	var buttons = [UIButton]()

	
	let kickSoundURL = NSBundle.mainBundle().URLForResource("Sounds/kick", withExtension: "wav")!
	let hatSoundURL = NSBundle.mainBundle().URLForResource("Sounds/hat", withExtension: "wav")!
	let snareSoundURL = NSBundle.mainBundle().URLForResource("Sounds/snare", withExtension: "wav")!
	let clapSoundURL = NSBundle.mainBundle().URLForResource("Sounds/clap", withExtension: "wav")!
	let synthSoundURL = NSBundle.mainBundle().URLForResource("Sounds/synth", withExtension: "m4a")!
	
	let bruk0 = NSBundle.mainBundle().URLForResource("Sounds/RSChordA1", withExtension: "aif")!
	let bruk1 = NSBundle.mainBundle().URLForResource("Sounds/RSChordA2", withExtension: "aif")!
	let bruk2 = NSBundle.mainBundle().URLForResource("Sounds/RSChordA3", withExtension: "aif")!
	let bruk3 = NSBundle.mainBundle().URLForResource("Sounds/RSChordA4", withExtension: "aif")!
	let bruk4 = NSBundle.mainBundle().URLForResource("Sounds/RSChordAbass1", withExtension: "aif")!
	let bruk5 = NSBundle.mainBundle().URLForResource("Sounds/RSChordAbass2", withExtension: "aif")!
	let bruk6 = NSBundle.mainBundle().URLForResource("Sounds/RSChordAbass3", withExtension: "aif")!
	let bruk7 = NSBundle.mainBundle().URLForResource("Sounds/RSChordAbass4", withExtension: "aif")!
	let bruk8 = NSBundle.mainBundle().URLForResource("Sounds/bruk8", withExtension: "wav")!
	let bruk9 = NSBundle.mainBundle().URLForResource("Sounds/bruk9", withExtension: "wav")!
	let bruk10 = NSBundle.mainBundle().URLForResource("Sounds/bruk10", withExtension: "wav")!
	let bruk11 = NSBundle.mainBundle().URLForResource("Sounds/bruk11", withExtension: "wav")!
	let bruk12 = NSBundle.mainBundle().URLForResource("Sounds/hat", withExtension: "wav")!
	let bruk13 = NSBundle.mainBundle().URLForResource("Sounds/RSKick", withExtension: "aif")!
	let bruk14 = NSBundle.mainBundle().URLForResource("Sounds/RSSnare", withExtension: "aif")!
	let bruk15 = NSBundle.mainBundle().URLForResource("Sounds/RShihat", withExtension: "aif")!
	
	
	
	var players = [AVAudioPlayer](count: 16, repeatedValue: AVAudioPlayer())
	
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
	
	@IBAction func button11tap(sender: UIButton) {
		do {
			try players[0] = AVAudioPlayer(contentsOfURL: bruk0)
		} catch {
			
		}
		players[0].prepareToPlay()
		players[0].play()
	}
	
	@IBAction func button12tap(sender: UIButton) {
		do {
			try players[1] = AVAudioPlayer(contentsOfURL: bruk1)
		} catch {
			
		}
		players[1].prepareToPlay()
		players[1].play()
	}
	
	@IBAction func button13tap(sender: UIButton) {
		do {
			try players[2] = AVAudioPlayer(contentsOfURL: bruk2)
		} catch {
			
		}
		players[2].prepareToPlay()
		players[2].play()
	}
	
	@IBAction func button14tap(sender: UIButton) {
		do {
			try players[3] = AVAudioPlayer(contentsOfURL: bruk3)
		} catch {
			
		}
		players[3].prepareToPlay()
		players[3].play()

	}
	
	@IBAction func button21tap(sender: UIButton) {
		do {
			try players[4] = AVAudioPlayer(contentsOfURL: bruk4)
		} catch {
			
		}
		players[4].prepareToPlay()
		players[4].play()

	}
	
	
	@IBAction func button22tap(sender: UIButton) {
		do {
			try players[5] = AVAudioPlayer(contentsOfURL: bruk5)
		} catch {
			
		}
		players[5].prepareToPlay()
		players[5].play()

	}
	
	@IBAction func button23tap(sender: UIButton) {
		do {
			try players[6] = AVAudioPlayer(contentsOfURL: bruk6)
		} catch {
			
		}
		players[6].prepareToPlay()
		players[6].play()

	}
	
	
	@IBAction func button24tap(sender: UIButton) {
		do {
			try players[7] = AVAudioPlayer(contentsOfURL: bruk7)
		} catch {
			
		}
		players[7].prepareToPlay()
		players[7].play()

	}
	
	@IBAction func button31tap(sender: UIButton) {
		do {
			try players[8] = AVAudioPlayer(contentsOfURL: bruk8)
		} catch {
			
		}
		players[8].prepareToPlay()
		players[8].play()
	}
	@IBAction func button32tap(sender: UIButton) {
		do {
			try players[9] = AVAudioPlayer(contentsOfURL: bruk9)
		} catch {
			
		}
		players[9].prepareToPlay()
		players[9].play()
	}
	@IBAction func button33tap(sender: UIButton) {
		do {
			try players[10] = AVAudioPlayer(contentsOfURL: bruk10)
		} catch {
			
		}
		players[10].prepareToPlay()
		players[10].play()
	}
	@IBAction func button34tap(sender: UIButton) {
		do {
			try players[11] = AVAudioPlayer(contentsOfURL: bruk11)
		} catch {
			
		}
		players[11].prepareToPlay()
		players[11].play()
	}
	@IBAction func button41tap(sender: UIButton) {
		do {
			try players[12] = AVAudioPlayer(contentsOfURL: bruk12)
		} catch {
			
		}
		players[12].prepareToPlay()
		players[12].play()
	}
	@IBAction func button42tap(sender: UIButton) {
		do {
			try players[13] = AVAudioPlayer(contentsOfURL: bruk13)
		} catch {
			
		}
		players[13].prepareToPlay()
		players[13].play()
	}
	@IBAction func button43tap(sender: UIButton) {
		do {
			try players[14] = AVAudioPlayer(contentsOfURL: bruk14)
		} catch {
			
		}
		players[14].prepareToPlay()
		players[14].play()
	}
	@IBAction func button44tap(sender: UIButton) {
		do {
			try players[15] = AVAudioPlayer(contentsOfURL: bruk15)
		} catch {
			
		}
		players[15].prepareToPlay()
		players[15].play()
	}
	
	
	
	
	
	
	
}

