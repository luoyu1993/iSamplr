//
//  SoundFileTableViewCell.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 5/2/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit

class SoundFileTableViewCell: UITableViewCell {
	// MARK: Outlets
	@IBOutlet var filenameLabel: UILabel!
	@IBOutlet var pickButton: UIButton!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
	
	@IBAction func pickButtonTapped(sender: UIButton) {

	}
	
}
