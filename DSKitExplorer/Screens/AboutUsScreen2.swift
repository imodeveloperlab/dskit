//
//  AboutUsScreen2.swift
//  DSKit
//
//  Created by Ivan Borinschi on 31.13.3033.
//

import SwiftUI
import DSKit

import MapKit

struct AboutUsScreen2: View {
    
    @State private var isSwitchOn = true
    @Environment(\.appearance) var appearance: DSAppearance
    @State private var favoriteColor = 2
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    let infoImageGallery = [p1Image, p2Image, p3Image]
    
    var body: some View {
        
        DSVStack(spacing: .medium) {
            
            Picker("What is your favorite color?", selection: $favoriteColor) {
                Text("Info").tag(0)
                Text("Feedback").tag(1)
                Text("Contacts").tag(2)
            }
            .pickerStyle(.segmented)
            
            switch favoriteColor {
            case 0:
                infoView
            case 1:
                feedbackView
            case 2:
                contactsView
            default:
                infoView
            }
        }.dsScreen()
    }
    
    var infoView: some View {
        ScrollView {
//            DSVStack {
//                DSVStack {
//                    DSText("Best Store in town", .font(.title2))
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    DSText("Here you will feel the attitude, here you will receive quality, here you will see the atmosphere of an authentic store", .font(.body))
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                }
//                
//                DSCoverFlow(height: 300, data: infoImageGallery, id: \.self) { image in
//                    DSImageView(url: image).dsCornerRadius()
//                }
//                
//                DSVStack {
//                    DSText(DSFaker().text, .font(.body)).frame(maxWidth: .infinity, alignment: .leading)
//                    DSText(DSFaker().text, .font(.subheadline)).frame(maxWidth: .infinity, alignment: .leading)
//                    DSText(DSFaker().text, .font(.body)).frame(maxWidth: .infinity, alignment: .leading)
//                }
//            }
        }
    }
    
    var feedbackView: some View {
        DSVStack(spacing: .zero) {
            ScrollView {
                DSVStack {
                    ForEach(0..<5) { index in
                        DSHStack(spacing: .medium) {
                            DSImageView(url: nil, style: .circle)
                                .dsSize(100)
                            
                            DSVStack(spacing: .small) {
                                DSText("DSFaker().name").dsTextStyle(.headline)
                                   .frame(maxWidth: .infinity, alignment: .leading)
                                DSHStack {
                                    DSImageView(systemName: "calendar", size: .size(14), tint: .text(.caption1))
                                    DSText("14.05.2024").dsTextStyle(.subheadline)
                                    DSHStack(spacing: .small) {
                                        DSImageView(systemName: "star.fill", size: .size(14), tint: .color(Color.yellow))
                                        DSImageView(systemName: "star.fill", size: .size(14), tint: .color(Color.yellow))
                                        DSImageView(systemName: "star.fill", size: .size(14), tint: .color(Color.yellow))
                                        DSImageView(systemName: "star.fill", size: .size(14), tint: .color(Color.yellow))
                                        DSImageView(systemName: "star", size:.size(14), tint: .text(.caption1))
                                    }
                                }
                                DSText("DSFaker().text").dsTextStyle(.caption1)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                        }
                        .dsPadding()
                        .dsSecondaryBackground()
                        .dsCornerRadius()
                    }
                }
                Spacer()
            }
            
            DSButton(title: "Leave feedback", rightSystemName: "message.fill", action: { })
                .topShadow(padding: .regular)
        }
    }
    
    
    var contactsView: some View {
        DSVStack(spacing: .zero) {
            ScrollView {
                DSVStack {
                    ContactView(iconName: "phone.fill", title: "Phone:", info: "DSFaker().phoneNumber")
                    ContactView(iconName: "map.fill", title: "Address:", info: "DSFaker().streetAddress")
                    ContactView(iconName: "clock.fill", title: "Working Hours:", info: "Open ⋅ Closes 5PM")
                    
                    DSHStack(alignment: .healthSafetyAlignment, spacing: .regular) {
                        
                        DSVStack(spacing: .medium) {
                            DSImageView(systemName: "info.circle.fill", size: .font(.headline), tint: .text(.headline))
                                .alignmentGuide(.healthSafetyAlignment) { d in d[VerticalAlignment.center] }
                        }
                        
                        DSVStack {
                            DSText("Health and safety").dsTextStyle(.headline)
                                .alignmentGuide(.healthSafetyAlignment) { d in d[VerticalAlignment.center] }
                            DSText("· Mask required\n· Temperature check required\n· Staff wear masks\n· Staff get temperature checks")
                                .dsTextStyle(.subheadline, 14)
                                .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                    .dsPadding()
                    .dsSecondaryBackground()
                    .dsCornerRadius()
                    
                    Map(coordinateRegion: $region)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .dsHeight(200)
                        .dsCornerRadius()
                        .disabled(true)
                    
                    DSButton(title: "Get directions", rightSystemName: "location.fill", action: { })
                    
                }
                Spacer()
            }
        }
    }
}

fileprivate extension VerticalAlignment {
    struct HealthSafetyAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.top]
        }
    }
    
    static let healthSafetyAlignment = VerticalAlignment(HealthSafetyAlignment.self)
}

struct ContactView: View {
    
    let iconName: String
    let title: String
    let info: String
    
    var body: some View {
        DSHStack {
            DSImageView(systemName: iconName, size: .font(.headline), tint: .text(.headline))
            DSHStack {
                DSText(title).dsTextStyle(.smallHeadline)
                DSText(info)
                    .dsTextStyle(.subheadline, 14)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }.dsCardStyle()
    }
}

// MARK: - Testable

struct Testable_AboutUsScreen2: View {
    var body: some View {
        AboutUsScreen2()
    }
}

// MARK: - Preview

struct AboutUsScreen2_Previews: PreviewProvider {
    static var previews: some View {
        DSPreviewForEachAppearance { Testable_AboutUsScreen2() }
    }
}

fileprivate let p1Image = URL(string: "https://images.pexels.com/photos/164763/pexels-photo-164763.jpeg?cs=srgb&dl=pexels-pixabay-164763.jpg&fm=jpg")
fileprivate let p2Image = URL(string: "https://images.pexels.com/photos/264636/pexels-photo-264636.jpeg?cs=srgb&dl=pexels-pixabay-264636.jpg&fm=jpg")
fileprivate let p3Image = URL(string: "https://images.pexels.com/photos/1402407/pexels-photo-1402407.jpeg?cs=srgb&dl=pexels-lisa-fotios-1402407.jpg&fm=jpg")


