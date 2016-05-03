//
//  RecorderViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/28/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import AVFoundation

class RecorderViewController: UIViewController {
	// MARK: model setup
	let instance = ButtonModel.model
	var buttonTag: Int!

	// MARK: Outlets
	@IBOutlet var recordButton: UIButton!
	@IBOutlet var playButton: UIButton!
	@IBOutlet var applyButton: UIButton!
	
	// MARK: Instance Variables
	var recordingSession: AVAudioSession!
	var audioRecorder: AVAudioRecorder!
	var audioPlayer: AVAudioPlayer!
	var recording = false
	
	let recordSettings = [
		AVSampleRateKey : NSNumber(float: Float(44100.0)),
		AVFormatIDKey : NSNumber(int: Int32(kAudioFormatMPEG4AAC)),
		AVNumberOfChannelsKey : NSNumber(int: 2),
		AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))
	]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
		
		print(buttonTag)
		
		// UI
		playButton.hidden = true
		applyButton.hidden = true
		
		// initialize recorder
		let audioSession = AVAudioSession.sharedInstance()
		do {
			try audioSession.setCategory(AVAudioSessionCategoryRecord)
			try audioRecorder = AVAudioRecorder(URL: directoryURL()!, settings: recordSettings)
			audioRecorder.prepareToRecord()
		} catch {
			
		}
    }
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	class func getDocumentsDirectory() -> String {
		let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
		let documentsDirectory = paths[0]
		return documentsDirectory
	}

	
	// Helper function, returns the filename in proper format
	private func directoryURL() -> NSURL? {
		let fileManager = NSFileManager.defaultManager()
		let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
		let documentDirectory = urls[0] as NSURL
		let formatter = NSDateFormatter()
		formatter.dateFormat = "yyyy-MM-dd_HHmmss"
		let soundURL = documentDirectory.URLByAppendingPathComponent("iSamplr-REC_" + formatter.stringFromDate(NSDate()) + ".m4a")
		return soundURL
	}
	
	@IBAction func recordButtonTapped(sender: UIButton) {
		if !audioRecorder.recording {
			print(audioRecorder.recording)
			let audioSession = AVAudioSession.sharedInstance()
			do {
				try audioSession.setActive(true)
				audioRecorder.record()
			} catch {
				print("err")
			}
			
			recordButton.setTitle("Stop", forState: .Normal)
			playButton.hidden = true
			applyButton.hidden = true
			recording = true
		} else {
			audioRecorder.stop()
			let audioSession = AVAudioSession.sharedInstance()
			
			do {
				try audioSession.setActive(false)

				// AVAudioSessionCategoryAmbient allows the device to play through device's internet speakers,
				// not the phone speaker (the one that you use for phone calls)
				try audioSession.setCategory(AVAudioSessionCategoryAmbient)
			} catch {
				print("err")
			}
			
			
			recordButton.setTitle("Record", forState: .Normal)
			playButton.hidden = false
			applyButton.hidden = false
			recording = false
		}
	}
	
	@IBAction func playButtonTapped(sender: UIButton) {
		if (!audioRecorder.recording) {
			do {
				try audioPlayer = AVAudioPlayer(contentsOfURL: audioRecorder.url)
				audioPlayer.play()
			} catch {
			}
		}
	}
	
	@IBAction func applyButtonTapped(sender: UIButton) {
		
		let alertController = UIAlertController(title: "Save and apply?", message: nil, preferredStyle: .Alert)
		let cancelAction = UIAlertAction(title: "No", style: .Cancel) { (action) in
			// hitting the cancel button does nothing (just dismisses the UIAlert)
		}
		alertController.addAction(cancelAction)
		let OKAction = UIAlertAction(title: "Yes", style: .Default) { (_) in
			self.instance.players[self.buttonTag].soundFile = self.audioRecorder.url
			self.performSegueWithIdentifier("cancel", sender: self)
			self.navigationController?.popViewControllerAnimated(true)
		}
		alertController.addAction(OKAction)
		self.presentViewController(alertController, animated: true, completion: nil)
	}

	
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
		
    }
	

}
