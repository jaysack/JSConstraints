//
//  UIView+Extension.swift
//  JSConstraintsSample
//
//  Created by Jonathan Sack
//

import UIKit

public extension UIStackView {
    
    // MARK: - Set Edge Insets
    @available(iOS 11.0, tvOS 11.0, *)
    func setEdgeInsets(edgeInsets: UIEdgeInsets = .zero) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(
            top: edgeInsets.top,
            leading: edgeInsets.left,
            bottom: edgeInsets.bottom,
            trailing: edgeInsets.right
        )
    }
}
