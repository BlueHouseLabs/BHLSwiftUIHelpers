//
//  IndexedForEach.swift
//  
//
//  Created by Eric DeLabar on 12/30/22.
//

import SwiftUI

public struct IndexedForEach<Data: RandomAccessCollection, Content: View>: View where Data.Index == Int, Data.Element: Identifiable {
    let values: Data
    @ViewBuilder let builder: (Data.Element, Int) -> Content
    
    public var body: some View {
        ForEach(values.reduce(into: [(index: Int, value: Data.Element)](), { partialResult, value in
            partialResult.append( (index: partialResult.count, value: value) )
        }), id: \.value.id) { index, value in
            builder(value, index)
        }
    }
    
    public init(_ values: Data, @ViewBuilder builder: @escaping (Data.Element, Int) -> Content) {
        self.values = values
        self.builder = builder
    }
}
