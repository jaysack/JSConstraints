//
//  UIView+Extension.swift
//  JSConstraintsSample
//
//  Created by Jonathan Sack
//

#if canImport(UIKit)
import UIKit

public extension UIStackView {

    func setDefaultConfig(spacing: CGFloat = 0, axis: NSLayoutConstraint.Axis = .vertical, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {

        self.axis = axis
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    // MARK: - Set Edge Insets
    @available(iOS 11.0, tvOS 11.0, *)
    func setEdgeInsets(padding: CGFloat = 0) {
        setEdgeInsets(x: padding, y: padding)
    }

    @available(iOS 11.0, tvOS 11.0, *)
    func setEdgeInsets(x: CGFloat = 0, y: CGFloat = 0) {
        setEdgeInsets(top: y, leading: x, bottom: y, trailing: x)
    }

    @available(iOS 11.0, tvOS 11.0, *)
    func setEdgeInsets(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.isLayoutMarginsRelativeArrangement = true
        self.directionalLayoutMargins = NSDirectionalEdgeInsets(top: top,
                                                                leading: leading,
                                                                bottom: bottom,
                                                                trailing: trailing)
    }
}
#endif
