//
//  JSButton.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public class JSButton: UIButton {
    
    // MARK: - Proprety
    // Edge insets
    let edgeInsets: UIEdgeInsets

    // Font
    public var font: UIFont = .systemFont(ofSize: 17) {
        didSet {
            self.titleLabel?.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        }
    }
    
    // Text style
    public var textStyle: UIFont.TextStyle = .body {
        didSet {
            self.titleLabel?.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
        }
    }

    // MARK: - Init
    // Init w/ edge insets
    public init(edgeInsets: UIEdgeInsets) {
        self.edgeInsets = edgeInsets
        super.init(frame: .zero)
        
        // Set title label dynamic font
        self.titleLabel?.adjustsFontForContentSizeCategory = true
        self.titleLabel?.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: font)
    }
    
    // Init w/ coder
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Intrinsic Content Size
    public override var intrinsicContentSize: CGSize {
        let width = super.intrinsicContentSize.width + edgeInsets.horizontal
        let height = super.intrinsicContentSize.height + edgeInsets.vertical
        return CGSize(width: width, height: height)
    }
}
