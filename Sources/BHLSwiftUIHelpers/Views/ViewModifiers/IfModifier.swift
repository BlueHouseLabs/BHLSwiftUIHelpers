//
//  IfModifier.swift
//  
//
//  Created by Eric DeLabar on 3/31/23.
//

import SwiftUI

extension View {
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    /// Applies the given transform if the given condition evaluates to `true`.
    /// - Parameters:
    ///   - condition: The condition to evaluate.
    ///   - transform: The transform to apply to the source `View`.
    /// - Returns: Either the original `View` or the modified `View` if the condition is `true`.
    @ViewBuilder public func `ifLet`<Content: View, T>(value: T?, conditionCheck: (T?) -> T? = { $0 }, transform: (Self, T) -> Content) -> some View {
        if let unwrapped = conditionCheck(value) {
            transform(self, unwrapped)
        } else {
            self
        }
    }
}
