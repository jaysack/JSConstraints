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
        NSLayoutConstraint.activate(self)
    }

    func deactivateAll() {
        NSLayoutConstraint.deactivate(self)
    }

    func setPriority(to priority: UILayoutPriority) {
        self.forEach { $0.priority = priority }
    }
    
    func setPriority(to priority: Float) {
        self.forEach { $0.priority = UILayoutPriority(rawValue: priority) }
    }
}
