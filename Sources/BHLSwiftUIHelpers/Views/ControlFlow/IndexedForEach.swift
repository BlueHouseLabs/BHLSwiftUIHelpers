//
//  IndexedForEach.swift
//  
//
//  Created by Eric DeLabar on 12/30/22.
//

import SwiftUI

public struct IndexedForEach<Data: RandomAccessCollection, Content: View>: View where Data.Index == Int {
    let values: Data
    @ViewBuilder let builder: (Data.Element, Int) -> Content
    
    public var body: some View {
        ForEach(0..<values.count, id: \.self) { index in
            builder(values[index], index)
        }
    }
    
    public init(_ values: Data, @ViewBuilder builder: @escaping (Data.Element, Int) -> Content) {
        self.values = values
        self.builder = builder
    }
}
