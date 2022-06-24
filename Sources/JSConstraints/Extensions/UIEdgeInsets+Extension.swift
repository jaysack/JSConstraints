//
//  UIEdgeInsets+Extension.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    
    // MARK: - Properties
    var horizontal: CGFloat { (left + right) / 2 }
    var vertical: CGFloat { (top + bottom) / 2 }

    // MARK: - Init Methods
    // Init 4 corners insets
    init(inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }

    // Init vertical and horizontal insets
    init(vertical: CGFloat, horizontal: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }

    // Init vertical insets
    init(vertical: CGFloat) {
        self.init(top: vertical, bottom: vertical)
    }

    // Init vertical, left, and right insets
    init(vertical: CGFloat, left: CGFloat, right: CGFloat) {
        self.init(top: vertical, left: left, bottom: vertical, right: right)
    }

    // Init horizontal insets
    init(horizontal: CGFloat) {
        self.init(left: horizontal, right: horizontal)
    }

    // Init horizontal, top, and bottom insets
    init(horizontal: CGFloat, top: CGFloat, bottom: CGFloat) {
        self.init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }

    // Init top inset
    init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }

    // Init left inset
    init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }

    // Init bottom inset
    init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }

    // Init right inset
    init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
    
    // Init left and right insets
    init(top: CGFloat, bottom: CGFloat) {
        self.init(top: top, left: 0, bottom: bottom, right: 0)
    }

    // Init left and right insets
    init(left: CGFloat, right: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: right)
    }
}
