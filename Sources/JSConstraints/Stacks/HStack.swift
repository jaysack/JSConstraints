//
//  HStack.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

#if canImport(UIKit)
import UIKit

public class HStack: UIStackView, ProxyStackProtocol {

    // MARK: Init
    // Init programmatically
    public init(
        spacing: CGFloat = 16,
        alignment: UIStackView.Alignment = .fill,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.proxyAxis = .horizontal
        self.proxySpacing = spacing
        self.proxyAlignment = alignment
        self.proxyDistribution = distribution
        super.init(frame: .zero)
    }
    
    // Init w/ coder
    public required init(coder: NSCoder) {
        self.proxyAxis = .horizontal
        self.proxySpacing = 16
        self.proxyAlignment = .fill
        self.proxyDistribution = .fill
        super.init(coder: coder)
    }
    
    // MARK: Properties
    var proxyAxis: NSLayoutConstraint.Axis
    public override var axis: NSLayoutConstraint.Axis {
        didSet {
            proxyAxis = axis
        }
    }
    var proxySpacing: CGFloat
    public override var spacing: CGFloat {
        didSet {
            proxySpacing = spacing
        }
    }
    var proxyAlignment: UIStackView.Alignment
    public override var alignment: UIStackView.Alignment {
        didSet {
            proxyAlignment = alignment
        }
    }
    var proxyDistribution: UIStackView.Distribution
    public override var distribution: UIStackView.Distribution {
        didSet {
            proxyDistribution = distribution
        }
    }

    // MARK: Overrides
    public override func addArrangedSubview(_ view: UIView) {
        super.addArrangedSubview(view)
        setLayout()
    }
}
#endif
