//
//  HStack.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class HStack: UIStackView {

    // Init w/ properties
    public convenience init(
        spacing: CGFloat = 0,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.init()
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = alignment
        self.distribution = distribution
    }
    
    // Init w/ subviews
    public convenience init(
        arrangedSubviews: [UIView],
        spacing: CGFloat = 0
    ) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = .horizontal
        self.spacing = spacing
        self.alignment = .fill
        self.distribution = .fill
    }
}
#endif
