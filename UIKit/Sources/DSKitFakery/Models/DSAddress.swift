//
//  FakeAddress.swift
//  DSKit+Fakery
//
//  Created by Borinschi Ivan on 27.01.2021.
//

import Foundation
import MapKit

public struct DSAddress {
    
    public let address: String
    public let coordinate: CLLocationCoordinate2D
    public var title: String {
        self.address.components(separatedBy: ",").first ?? address
    }
}
