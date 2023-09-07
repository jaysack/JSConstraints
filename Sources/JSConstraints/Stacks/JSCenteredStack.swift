//
//  JSCenteredStack.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

public class JSCenteredStack: UIStackView {
    
    // MARK: Init
    // Init w/ properties
    public init(axis: NSLayoutConstraint.Axis = .horizontal, arrangedSubviews: [UIView] = []) {
        super.init(frame: .zero)
        self.axis = axis
        arrangedSubviews.forEach { addArrangedSubview($0) }
    }
    
    // Init w/ coder
    public required init(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: Properties
    private var spacerWidthConstraints: NSLayoutConstraint?
    private var spacerHeightConstraints: NSLayoutConstraint?

    // MARK: Spacer Views
    private lazy var startSpacer = getSpacerView()
    private lazy var endSpacer = getSpacerView()

    // MARK: Overrides
    public override func addArrangedSubview(_ view: UIView) {
        // Add start spacer
        if arrangedSubviews.isEmpty {
            super.addArrangedSubview(startSpacer)
        }
        // Remove end spacer
        if let spacer = arrangedSubviews.first(where: { $0 === endSpacer }) {
            spacerWidthConstraints = nil
            spacerHeightConstraints = nil
            removeArrangedSubview(spacer)
        }
        // Defer adding end spacer
        defer {
            super.addArrangedSubview(endSpacer)
            spacerWidthConstraints = endSpacer.widthAnchor.constraint(equalTo: startSpacer.widthAnchor)
            spacerHeightConstraints = endSpacer.heightAnchor.constraint(equalTo: startSpacer.heightAnchor)
            spacerWidthConstraints?.isActive = true
            spacerHeightConstraints?.isActive = true
        }
        // Add arranged subview
        super.addArrangedSubview(view)
    }
}

private extension JSCenteredStack {
    // Get spacer view
    func getSpacerView() -> UIView {
        let view = UIView()
        view.setContentHuggingPriority(.init(1), for: axis)
        view.setContentCompressionResistancePriority(.init(1), for: axis)
        return view
    }
}
