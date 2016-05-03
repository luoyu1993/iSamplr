//
//  FilerTableViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/29/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit
import AVFoundation

class FilerTableViewController: UITableViewController {
	var soundFileNames = [String]()
	var buttonTag: Int!
	var samplePlayer: AVAudioPlayer? = nil
	
	override func viewDidLoad() {
		super.viewDidLoad()
		soundFileNames = getFolderContents()
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
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
	
	
	// http://stackoverflow.com/questions/27721418/getting-list-of-files-in-documents-folder
	func getFolderContents() -> [String] {
		// We need just to get the documents folder url
		let documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		
		do {
			let directoryUrls = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsUrl, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
			let soundFiles = directoryUrls.filter{ $0.pathExtension == "m4a" }.map{ $0.lastPathComponent }
			var result = [String]()
			for soundfile in soundFiles {
				if let filename = soundfile {
//					let choppedFilename = (filename as NSString).substringToIndex(10)
					result.append(String(filename.characters.dropLast(4)))
				}
			}
			return result
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
		// this is dangerous
		return [String]()
	}
	
	// preview sound
	// http://stackoverflow.com/questions/24386766/ios-sound-not-playing-in-swift
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		
		/*
		// let audioPath = NSBundle.mainBundle().URLForResource(, withExtension: "m4a")
		print(soundFileNames[indexPath.row])
		let file = String(soundFileNames[indexPath.row])
		let path = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
		let url = NSURL(fileURLWithPath: path)
		let filePath = url.URLByAppendingPathComponent(soundFileNames[indexPath.row])
		
		do {
			try samplePlayer = AVAudioPlayer(contentsOfURL: file)
		} catch {}
		
		self.samplePlayer!.prepareToPlay()
		self.samplePlayer!.play()
		*/
		
		let path = NSBundle.mainBundle().pathForResource(String(soundFileNames[indexPath.row].characters.dropLast(4)), ofType: "m4a")
		let fileURL = NSURL(fileURLWithPath: path!)
		do {
			try samplePlayer = AVAudioPlayer(contentsOfURL: fileURL)
		} catch {}
		samplePlayer!.prepareToPlay()
		samplePlayer!.play()
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
	
	/*
	// Override to support rearranging the table view.
	override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
	
	}
	*/
	
	/*
	// Override to support conditional rearranging of the table view.
	override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	// Return false if you do not want the item to be re-orderable.
	return true
	}
	*/
	
	/*
	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	// Get the new view controller using segue.destinationViewController.
	// Pass the selected object to the new view controller.
	}
	*/
	
}

