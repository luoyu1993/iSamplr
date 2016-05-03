//
//  SoundFileTableViewCell.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 5/2/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import UIKit

class SoundFileTableViewCell: UITableViewCell {

	@IBOutlet var filenameLabel: UILabel!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
