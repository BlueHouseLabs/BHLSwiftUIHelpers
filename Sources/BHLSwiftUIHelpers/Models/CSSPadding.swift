//
//  CSSPadding.swift
//  
//
//  Created by Eric DeLabar on 12/31/22.
//

import Foundation
import BHLSwiftHelpers

public struct CSSPadding {
    let top: CGFloat?
    let trailing: CGFloat?
    let bottom: CGFloat?
    let leading: CGFloat?
    
    public init(top: CGFloat? = nil, trailing: CGFloat? = nil, bottom: CGFloat? = nil, leading: CGFloat? = nil) {
        self.top = top
        self.trailing = trailing
        self.bottom = bottom
        self.leading = leading
    }
    
    public init(_ paddings: [CGFloat]) {
        let top = paddings.getOrDefaultValue(index: 0)
        let trailing = paddings.getOrDefaultValue(index: 1) ?? top
        let bottom = paddings.getOrDefaultValue(index: 2) ?? top
        let leading = paddings.getOrDefaultValue(index: 3) ?? trailing
        
        self.init(
            top: top.paddingValue,
            trailing: trailing.paddingValue,
            bottom: bottom.paddingValue,
            leading: leading.paddingValue
        )
    }
}

extension CSSPadding: Equatable {}

public extension CGFloat {
    static var defaultPadding = CGFloat.leastNonzeroMagnitude
}

extension CSSPadding: ExpressibleByArrayLiteral {
    public init(arrayLiteral elements: CGFloat...) {
        self.init(elements)
    }
}

private extension CGFloat? {
    var paddingValue: CGFloat? {
        self == CGFloat.leastNonzeroMagnitude ? nil : self
    }
}
