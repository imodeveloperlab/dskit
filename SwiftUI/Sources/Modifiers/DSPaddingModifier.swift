//
//  DSPadding.swift
//  DSKit
//
//  Created by Ivan Borinschi on 14.12.2022.
//

import SwiftUI

public struct DSParentPaddingKey: EnvironmentKey {
    public static let defaultValue: CGFloat = 0
}

public extension EnvironmentValues {
    var parentPadding: CGFloat {
        get { self[DSParentPaddingKey.self] }
        set { self[DSParentPaddingKey.self] = newValue }
    }
}

public struct DSPaddingModifier: ViewModifier {
    
    @Environment(\.appearance) var appearance: DSAppearance
    let edge: Edge.Set
    let padding: DSPadding
    
    init(edge: Edge.Set, padding: DSPadding) {
        self.edge = edge
        self.padding = padding
    }
    
    public func body(content: Content) -> some View {
        let padding = getPadding()
        content
            .padding(edge, padding)
            .environment(\.parentPadding, padding)
    }
    
    func getPadding() -> CGFloat {
        return appearance.padding.value(for: padding)
    }
}

public extension View {
    func dsPadding(_ edge: Edge.Set = .all, _ padding: DSPadding = .medium) -> some View {
        let modifier = DSPaddingModifier(
            edge: edge,
            padding: padding
        )
        return self.modifier(modifier)
    }
    
    func dsPadding(_ padding: DSPadding = .medium) -> some View {
        let modifier = DSPaddingModifier(
            edge: .all,
            padding: padding
        )
        return self.modifier(modifier)
    }
}

#Preview {
    
    VStack {
        
        Text("Just Padding")
            .frame(width: 200)
            .background(Color.white)
            .dsPadding()
            .background(Color.red)
        
//        Text("Extra Small")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .extraSmall)
//            .background(Color.red)
//        Text("Smaller")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .smaller)
//            .background(Color.red)
//        Text("Small")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .small)
//            .background(Color.red)
//        Text("Medium")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .medium)
//            .background(Color.red)
//        Text("Medium Large")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .mediumLarge)
//            .background(Color.red)
//        Text("Large")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .large)
//            .background(Color.red)
//        Text("Extra Large")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .extraLarge)
//            .background(Color.red)
//        Text("Larger")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .larger)
//            .background(Color.red)
//        Text("Largest")
//            .frame(width: 200)
//            .background(Color.white)
//            .dsPadding(.all, .largest)
//            .background(Color.red)
    }
}
