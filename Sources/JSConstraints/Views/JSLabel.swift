//
//  JSLabel.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public class JSLabel: UILabel {
    
    // MARK: - Proprety
    // Edge insets
    let edgeInsets: UIEdgeInsets

    // Font
    public override var font: UIFont! {
        get {
            return self.font
        }
        set {
            self.font = UIFontMetrics(forTextStyle: textStyle).scaledFont(for: newValue)
        }
    }
    
    // Text style
    public var textStyle: UIFont.TextStyle = .body {
        didSet {
            self.font = self.font
        }
    }

    // MARK: - Init
    // Init w/ edge insets
    init(edgeInsets: UIEdgeInsets = .zero) {
        self.edgeInsets = edgeInsets
        super.init(frame: .zero)
        // Set edge insets
        // Set dynamic font
        self.adjustsFontForContentSizeCategory = true
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
