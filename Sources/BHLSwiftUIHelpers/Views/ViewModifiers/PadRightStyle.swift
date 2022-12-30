//
//  PadRightStyle.swift
//  
//
//  Created by Eric DeLabar on 11/21/22.
//

import SwiftUI

struct PadRightStyle: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            content
            Spacer(minLength: 0)
        }
    }
}

public extension View {
    func padRight() -> some View {
        modifier(PadRightStyle())
    }
}
