//
//  DSGroupedList.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 13.03.2023.
//

import SwiftUI
import DSKit

public struct DSGroupedList<Data, ID, Content>: View where Data: RandomAccessCollection, ID: Hashable, Content: View, Data.Index == Int {
    
    let data: Data
    let content: (Data.Element) -> Content
    let id: KeyPath<Data.Element, ID>
    
    public init(
        data: Data,
        id: KeyPath<Data.Element, ID>,
        @ViewBuilder content: @escaping (Data.Element) -> Content
    ) {
        self.data = data
        self.id = id
        self.content = content
    }
    
    public var body: some View {
        DSVStack {
            ForEach(data.indices, id: \.self) { index in
                let element = data[data.index(data.startIndex, offsetBy: index)]
                self.content(element)
                if index != data.indices.last {
                    DSDivider()
                }
            }
        }.dsCardStyle()
    }
}
