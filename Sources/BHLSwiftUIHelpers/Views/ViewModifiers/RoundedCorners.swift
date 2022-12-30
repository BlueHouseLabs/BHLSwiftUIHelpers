//
//  RoundedCornersStyle.swift
//  
//
//  Created by Eric DeLabar on 11/21/22.
//

#if canImport(UIKit)

import SwiftUI
import UIKit

struct RoundedCorner: InsettableShape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    var inset: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect.insetBy(dx: inset, dy: inset),
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }

    func inset(by amount: CGFloat) -> some InsettableShape {
        var roundedCorner = self
        roundedCorner.inset += amount
        return roundedCorner
    }
}

public extension View {
    
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
}

#endif
