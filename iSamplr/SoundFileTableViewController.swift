//
//  FilerTableViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/29/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import AVFoundation

class SoundFileTableViewController: UITableViewController {
	let instance = ButtonModel.model
	var soundFileNames = [String]()
	var documentsURL = NSURL()
	var buttonTag: Int!
	var samplePlayer = AVAudioPlayer()
	var selectedButton: Int!
	
	// override
	override func viewDidLoad() {
		super.viewDidLoad()
		soundFileNames = getFolderContents()
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return soundFileNames.count
	}
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SoundFileTableViewCell {
		let cellIdentifier = "cell"
		let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as! SoundFileTableViewCell
		cell.filenameLabel.text = String(self.soundFileNames[indexPath.row])
		return cell
	}
	
	/**
	Returns a list of file names (an array of Strings) in Documents directory.
	Read: http://stackoverflow.com/questions/27721418/getting-list-of-files-in-documents-folder
 	*/
	func getFolderContents() -> [String] {
		// We need just to get the documents folder url
		documentsURL = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		
		do {
			let directoryUrls = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsURL, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
			let soundFiles = directoryUrls.map{ $0.lastPathComponent }
			var result = [String]()
			for soundfile in soundFiles {
				if let filename = soundfile {
					result.append(filename)
				}
			}
			return result
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
		// this is dangerous
		return [String]()
	}
	
	/**
	Sets the corresponding button's sound to the selected sound file.
	*/
	@IBAction func soundPickButtonTapped(sender: UIButton) {
		let soundFile = documentsURL.URLByAppendingPathComponent(soundFileNames[selectedButton])
		self.instance.players[buttonTag].soundFile = soundFile
	}
	
	/**
	when a cell with filename of sound is tapped, it should play (like a preview, just like when you are picking a ringtone)
	* src: http://stackoverflow.com/questions/24386766/ios-sound-not-playing-in-swift
	* src: http://www.techotopia.com/index.php/Working_with_Directories_in_Swift_on_iOS_8
	*/
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		selectedButton = indexPath.row
		let soundFile = documentsURL.URLByAppendingPathComponent(soundFileNames[indexPath.row])
		print(soundFile, " played")
		do {
			try samplePlayer = AVAudioPlayer(contentsOfURL: soundFile)
		} catch {}
		samplePlayer.prepareToPlay()
		samplePlayer.play()
	}
	
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
	}
	
	// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		if editingStyle == .Delete {
			// Delete the row from the data source
			tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
		} else if editingStyle == .Insert {
			// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
	}
}

