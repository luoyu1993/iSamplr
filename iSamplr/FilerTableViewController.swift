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
	var soundFiles = [NSURL]()
	var buttonTag: Int!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		soundFiles = getFolderContents()
		// Uncomment the following line to preserve selection between presentations
		// self.clearsSelectionOnViewWillAppear = false
		print(self.soundFiles[0].debugDescription)
		print(self.soundFiles[0].description)

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
		return soundFiles.count
	}

	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> SoundFileTableViewCell {
		let cellIdentifier = "cell"
		let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as! SoundFileTableViewCell
		cell.filenameLabel.text = self.soundFiles[indexPath.row].debugDescription
		return cell
	}
	
	
	// http://stackoverflow.com/questions/27721418/getting-list-of-files-in-documents-folder
	func getFolderContents() -> [NSURL] {
		// We need just to get the documents folder url
		let documentsUrl = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		
		// now lets get the directory contents (including folders)
		do {
			let directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsUrl, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
			print(directoryContents)
			
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		// if you want to filter the directory contents you can do like this:
		
		
		do {
			let directoryUrls = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(documentsUrl, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
			return directoryUrls
		} catch let error as NSError {
			print(error.localizedDescription)
		}
		
		// this is dangerous
		return [NSURL]()
	}
	
	/*
	// Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
	// Return false if you do not want the specified item to be editable.
	return true
	}
	*/
	
	/*
// Override to support editing the table view.
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
	if editingStyle == .Delete {
	// Delete the row from the data source
	tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
	} else if editingStyle == .Insert {
	// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
	}
	}
	*/
	
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
