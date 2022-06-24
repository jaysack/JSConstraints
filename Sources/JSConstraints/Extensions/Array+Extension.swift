//
//  Array+Extension.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public extension Array where Element: NSLayoutConstraint {
    
    func activateAll() {
        self.forEach { $0.isActive = true }
    }

    func deactivateAll() {
        self.forEach { $0.isActive = false }
    }

    func setPriority(to priority: UILayoutPriority) {
        self.forEach { $0.priority = priority }
    }
    
    func setPriority(to priority: Float) {
        self.forEach { $0.priority = UILayoutPriority(rawValue: priority) }
    }
}
