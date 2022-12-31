//
//  CSSPaddingStyle.swift
//  
//
//  Created by Eric DeLabar on 12/31/22.
//

import SwiftUI

struct CSSPaddingStyle: ViewModifier {
    let padding: CSSPadding
    
    func body(content: Content) -> some View {
        content
            .padding(.top, padding.top)
            .padding(.trailing, padding.trailing)
            .padding(.bottom, padding.bottom)
            .padding(.leading, padding.leading)
    }
}

public extension View {
    func cssPadding(_ values: CSSPadding) -> some View {
        modifier(CSSPaddingStyle(padding: values))
    }
}
