//
//  DSShopLocationViewModel.swift
//  DSKit
//
//  Created by Borinschi Ivan on 17.12.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import MapKit

public struct DSMapVM: DSViewModel, Equatable, Hashable {
    
    public var text: DSTextComposer
    public var height: CGFloat = 200
    public var coordinate: CLLocationCoordinate2D
    
    public init(text: DSTextComposer, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.text = text
    }
    
    public init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.text = DSTextComposer()
    }
    
    public var identifier = "ShopLocation"
    public var accessibilityIdentifier = "ShopLocation"
    
    /// Style
    public var style: DSViewModelStyle = DSViewModelStyle(displayStyle: .grouped(inSection: false))
    
    @NonEquatable public var object: AnyObject?
    @NonEquatable public var didTap: ((DSViewModel) -> Void)?
    
    /// Supplementary items
    public var supplementaryItems: [DSSupplementaryView]?
    
    public var bottomSideView: DSSideView?
    public var leftSideView: DSSideView?
    public var rightSideView: DSSideView?
    public var topSideView: DSSideView?
}

public extension DSMapVM {
    
    func reuseIdentifier() -> String {
        return "\(String(describing: self))\(coordinate.latitude)\(coordinate.longitude)"
    }
    
    func height(_ layoutEnvironment: NSCollectionLayoutEnvironment?, section: DSSection) -> DSViewModelHeight {
        return .absolute(height)
    }
    
    func viewRepresentation() -> DSReusableUIView {
        return DSMapUIView.instanceFromNib()
    }
    
    func isEqual(to model: DSViewModel) -> Bool {
        guard let model = model as? Self else { return false }
        return self == model
    }
    
    func hash() -> String {
        return hashValue.string()
    }
}

extension CLLocationCoordinate2D: Equatable, Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(latitude)
        hasher.combine(longitude)
    }
    
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.longitude == rhs.longitude &&
                lhs.latitude == rhs.latitude
    }
}
