//
//  VStack.swift
//  JSConstraintsSample
//
//  Created by Jonathan Sack
//

#if canImport(UIKit)
import UIKit

public class VStack: UIStackView {

    public convenience init(spacing: CGFloat = 0, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fill) {
        self.init()
        self.setDefaultConfig(spacing: spacing, axis: .vertical, alignment: alignment, distribution: distribution)
    }
    
    public convenience init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.setDefaultConfig(spacing: spacing, axis: .vertical, alignment: .fill, distribution: .fill)
    }
}
#endif
