//
//  DSImage.swift
//  DSKit
//
//  Created by Ivan Borinschi on 15.12.2022.
//

import SwiftUI
import SDWebImageSwiftUI

public struct DSImageView: View {
    
    static let unitTestMode = ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] == nil
    
    @Environment(\.appearance) var appearance: DSAppearance
    @Environment(\.viewStyle) var viewStyle: DSViewStyle
    @StateObject var imageManager = ImageManager()
    let image: DSImage
    @State private var imageLoaded = false
    
    @State var imageSize: CGSize = .zero
    
    public init(dsImage: DSImage) {
        self.image = dsImage
    }
    
    public init(
        systemName: String,
        size: DSSize,
        tint: DSColorKey? = nil
    ) {
        self.image = DSImage(
            systemName: systemName,
            displayShape: .none,
            size: size,
            tintColor: tint,
            contentMode: .scaleAspectFit
        )
    }
    
    public init(
        uiImage: UIImage?,
        displayShape: DSDisplayShape = .none,
        size: DSSize = .fillUpTheSpace,
        tintColor: DSColorKey? = nil,
        contentMode: DSContentMode = .scaleAspectFill
    ) {
        self.image = DSImage(
            uiImage: uiImage,
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        named: String,
        displayShape: DSDisplayShape = .none,
        size: DSSize = .fillUpTheSpace,
        tintColor: DSColorKey? = nil,
        contentMode: DSContentMode = .scaleAspectFill
    ) {
        self.image = DSImage(
            named: named,
            displayShape: displayShape,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public init(
        url: URL?,
        style: DSDisplayShape = .none,
        size: DSSize = .fillUpTheSpace,
        tintColor: DSColorKey? = nil,
        contentMode: DSContentMode = .scaleAspectFill
    ) {
        self.image = .init(
            content: .imageURL(url: url),
            displayShape: style,
            size: size,
            tintColor: tintColor,
            contentMode: contentMode
        )
    }
    
    public var body: some View {
        switch image.content {
        case .system(name: let name):
            Image(systemName: name)
                .resizable()
                .setImageTint(tint: image.tintColor)
                .setContentMode(mode: image.contentMode)
                .dsSize(image.size)
        case .image(image: let uiImage):
            
            if DSImageView.unitTestMode {
                Color.gray.opacity(0.1)
                    .dsSize(image.size)
                    .setDisplayShape(shape: image.displayShape)
            } else if let uiImage {
                Image(uiImage: uiImage)
                    .resizable()
                    .setImageTint(tint: image.tintColor)
                    .setContentMode(mode: image.contentMode)
                    .dsSize(image.size)
                    .setDisplayShape(shape: image.displayShape)
            } else {
                Color.gray.opacity(0.1)
                    .dsSize(image.size)
                    .setDisplayShape(shape: image.displayShape)
            }
        case .imageURL(url: let url):
            
            GeometryReader(content: { geometry in
                Group {
                    if imageManager.image != nil {
                        
                        Color.gray.opacity(0.1)
                            .overlay(alignment: .center) {
                                Image(uiImage: imageManager.image!)
                                    .resizable()
                                    .setContentMode(mode: image.contentMode)
                                    .opacity(imageLoaded ? 1 : 0)
                                    .onAppear {
                                        if imageManager.cacheType == .none {
                                            withAnimation { imageLoaded = true }
                                        } else {
                                            imageLoaded = true
                                        }
                                    }
                            }
                            .setDisplayShape(shape: image.displayShape)
                        
                    } else {
                        Color.gray.opacity(0.1)
                            .setDisplayShape(shape: image.displayShape)
                    }
                }
                .onAppear {
                    if DSImageView.unitTestMode {
                        return
                    }
                    
                    let transformer = SDImageResizingTransformer(size: CGSize(width: geometry.size.width * 3, height:  geometry.size.height * 3), scaleMode: .aspectFill)
                    self.imageManager.load(url: url, context: [.imageTransformer: transformer])
                }
                .onDisappear {
                    self.imageManager.cancel()
                }
            }).dsSize(image.size)
        }
    }
}

struct DSImageView_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { DSPreview {
                
                DSHStack {
                    DSImageView(
                        url: URL(string: "https://images.unsplash.com/photo-1702540122576-dd7d387f652f?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        style: .circle,
                        size: .size(50)
                    )
                    
                    DSImageView(
                        url: URL(string: "https://images.unsplash.com/photo-1702540122576-dd7d387f652f?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        style: .capsule,
                        size: .size(width: 100, height: 50)
                    )
                    
                    DSImageView(
                        url: URL(string: "https://images.unsplash.com/photo-1702540122576-dd7d387f652f?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                        style: .none,
                        size: .size(50)
                    )
                }
                
                DSHStack {
                    DSImageView(
                        uiImage: UIImage(named: "demo", in: Bundle(identifier: "app.DSKit"), with: nil),
                        displayShape: .circle,
                        size: .size(50)
                    )
                    
                    DSImageView(
                        uiImage: UIImage(named: "demo", in: Bundle(identifier: "app.DSKit"), with: nil),
                        displayShape: .capsule,
                        size: .size(50)
                    )
                    
                    DSImageView(
                        uiImage: UIImage(named: "demo", in: Bundle(identifier: "app.DSKit"), with: nil),
                        displayShape: .none,
                        size: .size(width: 100, height: 50)
                    )
                }
                
                DSHStack {
                    DSImageView(systemName: "sun.rain.fill", size: .font(.headline), tint: .color(.red))
                    DSImageView(systemName: "sun.rain.fill", size: .font(.subheadline), tint: .color(.red))
                    DSImageView(systemName: "sun.rain.fill", size: .font(.caption1), tint: .color(.red))
                    DSImageView(systemName: "sun.rain.fill", size: .font(.caption2), tint: .color(.red))
                }
            }
        }
    }
}
