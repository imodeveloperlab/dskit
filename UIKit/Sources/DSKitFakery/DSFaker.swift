//
//  DSFaker.swift
//  DSKit+Fakery
//
//  Created by Borinschi Ivan on 27.01.2021.
//

import Foundation
import MapKit
import Fakery

public class DSFaker {
    
    let faker = Faker()
    
    public init() {
        
    }
    
    public var text: String {
        return faker.lorem.paragraph()
    }
    
    public var word: String {
        return faker.lorem.word()
    }
    
    public var sentence: String {
        return faker.lorem.sentence()
    }
    
    public var phoneNumber: String {
        return faker.phoneNumber.cellPhone()
    }
    
    public var streetAddress: String {
        return faker.address.streetAddress()
    }
    
    public var name: String {
        return faker.name.name()
    }
    
    public var addresses: [DSAddress] {
        
        [DSAddress(address: "325 Broadway, Bayonne, NJ 07002",
                   coordinate: CLLocationCoordinate2D(latitude: 40.764382, longitude: -73.973045)),
         DSAddress(address: "295 Avenue B, Bayonne, NJ 07002",
                   coordinate: CLLocationCoordinate2D(latitude: 40.6634361, longitude: -74.115727)),
         DSAddress(address: "923 Broadway Bayonne, NJ 07002",
                   coordinate: CLLocationCoordinate2D(latitude: 40.6788119, longitude: -74.1063384)),
         DSAddress(address: "833 Broadway, New York, NY 10003",
                   coordinate: CLLocationCoordinate2D(latitude: 40.7337279, longitude: -73.9915569)),
         DSAddress(address: "45 Rockefeller Plaza, New York, NY 10111",
                   coordinate: CLLocationCoordinate2D(latitude: 40.7597203, longitude: -73.97837))]
    }
    
    public var address: DSAddress {
        
        DSAddress(address: "325 Broadway, Bayonne, NJ 07002",
                  coordinate: CLLocationCoordinate2D(latitude: 40.764382, longitude: -73.973045))
    }
    
    public var persons: [DSPerson] {
        
        [0,1,2,3,4].map { (index) -> DSPerson in
            
            DSPerson(name: faker.name.name(),
                     description: "Pro Barber",
                     image: URL.profileUrl(index: index),
                     email: faker.internet.email(),
                     phone: faker.phoneNumber.cellPhone())
        }
    }
    
    public var person: DSPerson {
        
        DSPerson(name: faker.name.name(),
                 description: "Pro Barber",
                 image: URL.profileUrl(index: 0),
                 email: faker.internet.email(),
                 phone: faker.phoneNumber.cellPhone())
    }
    
    public var barbers: [DSPerson] {
        
        return [0,1,2,3,4].map { (index) -> DSPerson in
            
            DSPerson(name: faker.name.name(),
                     description: "Pro Barber",
                     image: URL.barberUrl(index: index),
                     email: faker.internet.email(),
                     phone: faker.phoneNumber.cellPhone())
        }
    }
}
