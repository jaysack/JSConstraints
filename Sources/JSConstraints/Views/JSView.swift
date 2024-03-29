//
//  JSView.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public class JSView: UIView {

    // MARK: - Properties
    let edgeInsets: UIEdgeInsets

    // MARK: - Init
    // Init w/ edge insets
    public init(edgeInsets: UIEdgeInsets) {
        self.edgeInsets = edgeInsets
        super.init(frame: .zero)
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
