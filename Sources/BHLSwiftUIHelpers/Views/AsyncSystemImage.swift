//
//  AsyncSystemImage.swift
//
//
//  Created by Eric DeLabar on 1/14/24.
//

import SwiftUI

public struct AsyncSystemImage<ID: Equatable>: View {
    
    let id: ID
    let width: CGFloat?
    let height: CGFloat?
    
    @State var systemImage: String
    @State var loading = true
    let loader: () async -> String
    
    public var body: some View {
        Image(systemName: systemImage)
            .resizable()
            .frame(width: width, height: height)
            .if(loading) { content in
                content.redacted(reason: .placeholder)
            }
            .task(id: id) {
                let result = await loader()
                withAnimation {
                    systemImage = result
                    loading = false
                }
            }
    }
    
    public init(id: ID, size: CGSize? = nil, placeholderSystemImage: String = "arrow.2.squarepath", loader: @escaping () async -> String) {
        self.id = id
        self.width = size?.width
        self.height = size?.height
        self._systemImage = State(initialValue: placeholderSystemImage)
        self.loader = loader
    }
    
}
