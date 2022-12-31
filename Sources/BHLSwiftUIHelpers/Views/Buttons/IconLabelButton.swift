//
//  IconLabelButton.swift
//  
//
//  Created by Eric DeLabar on 12/31/22.
//

import SwiftUI

public protocol IconLabelButtonContext {
    var sfSymbol: String { get }
    var buttonText: String { get }
}

public struct IconLabelButton<Context: IconLabelButtonContext>: View {
    
    let context: Context?
    let action: (Context) -> Void
    
    public var body: some View {
        if let context {
            Button("\(Image(systemName: context.sfSymbol)) \(context.buttonText)") {
                action(context)
            }
        } else {
            Button("\(Image(systemName: "space")) Placeholder") {}
                .opacity(0)
                .disabled(true)
        }
    }
    
    public init(context: Context?, action: @escaping (Context) -> Void) {
        self.context = context
        self.action = action
    }
    
}
