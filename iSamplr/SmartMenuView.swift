//
//  SmartMenuViewController.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 4/27/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//
//  Reference: http://zappdesigntemplates.com/create-your-own-overlay-view-in-swift/

import UIKit

@IBDesignable
class SmartMenuView: UIView {
	
	// MARK: Outlets
	@IBOutlet var cancelButton: UIButton!
	@IBOutlet var recordButton: UIButton!
	@IBOutlet var changeDisplayColorButton: UIButton!
	@IBOutlet var changeTapColorButton: UIButton!
	@IBOutlet var loadSoundFileButton: UIButton!
//	@IBOutlet var blurEffectView: UIVisualEffectView!
	
	// MARK: UI
	
	// view that holds everything that is loaded from the .xib file.
	var view: UIView!
	
	var loaded = false
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setupView()

	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupView()
	}

	func setupView() {
		view = loadViewFromXibFile()
		view.frame = bounds
		view.translatesAutoresizingMaskIntoConstraints = false
		self.addSubview(view)
		
		translatesAutoresizingMaskIntoConstraints = false
		
		/// Adds a shadow to our view
		view.layer.cornerRadius = 4.0
		view.layer.shadowColor = UIColor.blackColor().CGColor
		view.layer.shadowOpacity = 0.2
		view.layer.shadowRadius = 4.0
		view.layer.shadowOffset = CGSizeMake(0.0, 8.0)
		
//		blurEffectView.layer.cornerRadius = 4.0
	}
	
	// MARK: Actions
	
	/**
	* Updates constraints for the view. 
	* Specifies the height and width for the view.
	*/
	override func updateConstraints() {
		super.updateConstraints()
		
		addConstraint(NSLayoutConstraint(item: self, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 170.0))
		addConstraint(NSLayoutConstraint(item: self, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 200.0))
		
		addConstraint(NSLayoutConstraint(item: view, attribute: .Top, relatedBy: .Equal, toItem: self, attribute: .Top, multiplier: 1.0, constant: 0.0))
		addConstraint(NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: self, attribute: .Bottom, multiplier: 1.0, constant: 0.0))
		addConstraint(NSLayoutConstraint(item: view, attribute: .Trailing, relatedBy: .Equal, toItem: self, attribute: .Trailing, multiplier: 1.0, constant: 0.0))
		addConstraint(NSLayoutConstraint(item: view, attribute: .Leading, relatedBy: .Equal, toItem: self, attribute: .Leading, multiplier: 1.0, constant: 0.0))
	}

	/**
	* displays the smart menu subview.
	* @param onView the UIView to put this subview on
	* @param onButton the button that called this subview (for positions)
	*/
	func displayView(onView: UIView, onButton: UIButton) {
		// decide where to put this overlay view
		onView.addConstraint(NSLayoutConstraint(item: self, attribute: .CenterY, relatedBy: .Equal, toItem: onView, attribute: .CenterY, multiplier: 1.0, constant: -80.0)) // move it a bit upwards
		onView.addConstraint(NSLayoutConstraint(item: self, attribute: .CenterX, relatedBy: .Equal, toItem: onView, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
        onView.needsUpdateConstraints()
	}
	
	/**
	* hides the smart menu subview.
	*/
	private func hideView() {
		UIView.animateWithDuration(0.3, animations: { () -> Void in
			self.transform = CGAffineTransformMakeScale(0.1, 0.1)
		}) { (finished) -> Void in
			self.removeFromSuperview()
		}
	}
	
	@IBAction func cancelButtonTapped(sender: UIButton) {
		hideView()
	}
	
	@IBAction func loadButtonTapped(sender: UIButton) {
		
		
	}
	
	@IBAction func recordButtonTapped(sender: UIButton) {
		
		
	}
	
	@IBAction func changeDisplayColorButtonTapped(sender: UIButton) {
		
		
	}
	
	@IBAction func changeTapColorButtonTapped(sender: UIButton) {
		
		
	}
	
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
	
	/**
	* Loads a view instance from the xib file
	* @returns the loaded view
	*/
	func loadViewFromXibFile() -> UIView {
		let bundle = NSBundle(forClass: self.dynamicType)
		let nib = UINib(nibName: "SmartMenuView", bundle: bundle)
		let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
		return view
		
	}
	

}
