//
//  PadLeftStyle.swift
//  
//
//  Created by Eric DeLabar on 11/21/22.
//

import SwiftUI

struct PadLeftStyle: ViewModifier {
    func body(content: Content) -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            content
        }
    }
}

public extension View {
    func padLeft() -> some View {
        modifier(PadLeftStyle())
    }
}
