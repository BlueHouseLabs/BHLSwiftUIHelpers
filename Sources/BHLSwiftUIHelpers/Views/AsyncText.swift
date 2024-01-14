//
//  AsyncText.swift
//
//
//  Created by Eric DeLabar on 1/14/24.
//

import SwiftUI

public struct AsyncText<ID: Equatable>: View {
    
    let id: ID
    @State var content: String
    @State var loading = true
    let loader: () async -> String
    
    public var body: some View {
        Text(content)
            .if(loading) { content in
                content.redacted(reason: .placeholder)
            }
            .task(id: id) {
                let result = await loader()
                withAnimation {
                    content = result
                    loading = false
                }
            }
    }
    
    public init(id: ID, placeholder: String = "Placeholder", loader: @escaping () async -> String) {
        self.id = id
        self._content = State(initialValue: placeholder)
        self.loader = loader
    }
    
}
