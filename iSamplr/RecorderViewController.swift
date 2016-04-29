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

	@IBOutlet var recordButton: UIButton!
	@IBOutlet var playAndStopButton: UIButton!
	@IBOutlet var applyButton: UIButton!
	
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
		
		
		// UI
		playAndStopButton.hidden = true
		applyButton.hidden = true
		
		// initialize recorder
		let audioSession = AVAudioSession.sharedInstance()
		do {
			try audioSession.setCategory(AVAudioSessionCategoryRecord)
			try audioRecorder = AVAudioRecorder(URL: directoryURL()!,
			                                    settings: recordSettings)
			audioRecorder.prepareToRecord()
		} catch {
		}
		

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	// creating directory
	func directoryURL() -> NSURL? {
		let fileManager = NSFileManager.defaultManager()
		let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
		let documentDirectory = urls[0] as NSURL
		let soundURL = documentDirectory.URLByAppendingPathComponent("sound.m4a")
		return soundURL
	}
	
	@IBAction func recordButtonTapped(sender: UIButton) {
		print("recordbuttontapped")
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
			playAndStopButton.hidden = true
			applyButton.hidden = true
			recording = true
		} else {
			audioRecorder.stop()
			let audioSession = AVAudioSession.sharedInstance()
			
			do {
				try audioSession.setActive(false)
				
				// this category allows the device to play through device's speakers, not the mini ear speakers for phone
				try audioSession.setCategory(AVAudioSessionCategoryAmbient)
			} catch {
				print("err")
			}
			
			
			recordButton.setTitle("Record", forState: .Normal)
			playAndStopButton.hidden = false
			applyButton.hidden = false
			recording = false
		}
	}
	
	@IBAction func playAndStopButtonTapped(sender: UIButton) {
	}
	
	@IBAction func applyButtonTapped(sender: UIButton) {
	}

	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
