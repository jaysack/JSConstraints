//
//  ProxyStackProtocol.swift
//  JSConstraints
//
//  Created by Jonathan Sack.
//  Copyright © Jonathan Sack. All rights reserved.
//

import UIKit

protocol ProxyStackProtocol: UIStackView {
    var proxyAxis: NSLayoutConstraint.Axis { get }
    var proxySpacing: CGFloat { get }
    var proxyAlignment: UIStackView.Alignment { get }
    var proxyDistribution: UIStackView.Distribution { get }
    func setLayout()
}
extension ProxyStackProtocol {
    func setLayout() {
        axis = proxyAxis
        spacing = proxySpacing
        alignment = proxyAlignment
        distribution = proxyDistribution
    }
}
