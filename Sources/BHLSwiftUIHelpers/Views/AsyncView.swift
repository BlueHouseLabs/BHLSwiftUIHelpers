//
//  AsyncView.swift
//
//
//  Created by Eric DeLabar on 1/14/24.
//

import SwiftUI

public struct AsyncView<ID: Equatable, Model, V: View>: View {
    
    enum Result {
        case loading
        case done(Model)
    }
    
    let id: ID
    @State var loading: Result = .loading
    let loader: () async -> Model
    let builder: (Model) -> V
    
    public var body: some View {
        Group {
            switch loading {
            case .loading:
                ProgressView()
            case .done(let model):
                builder(model)
            }
        }
        .task(id: id) {
            let result = await loader()
            withAnimation {
                loading = .done(result)
            }
        }
    }
    
    public init(id: ID, loader: @escaping () async -> Model, @ViewBuilder builder: @escaping (Model) -> V) {
        self.id = id
        self.loader = loader
        self.builder = builder
    }
    
}
