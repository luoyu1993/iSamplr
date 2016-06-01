//
//  ButtonColor.swift
//  iSamplr
//
//  Created by Hun Jae Lee on 5/31/16.
//  Copyright © 2016 Hun Jae Lee. All rights reserved.
//

import Foundation
import UIKit

/// Represents which button color to use when changing button color
enum ButtonColor : Int {
	case Gray = 0, Red, Blue, Green, Yellow
	
	/// returns a simple String description of this ButtonColor enum
	func simpleDescription() -> String {
		switch self {
		case .Gray:
			return "gray"
		case .Red:
			return "red"
		case .Blue:
			return "blue"
		case .Green:
			return "green"
		case .Yellow:
			return "yellow"
		}
	}
	
	/// returns the UIImage of each corresponding color's `UIImage`.
	func image() -> UIImage {
		switch self {
		case .Gray:
			return UIImage(named: "Images/button.png")!
		case .Red:
			return UIImage(named: "Images/button_red.png")!
		case .Blue:
			return UIImage(named: "Images/button_blue.png")!
		case .Green:
			return UIImage(named: "Images/button_green.png")!
		case .Yellow:
			return UIImage(named: "Images/button_yellow.png")!
		}
	}
}