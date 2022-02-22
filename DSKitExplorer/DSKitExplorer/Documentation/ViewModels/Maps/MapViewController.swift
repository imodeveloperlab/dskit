//
//  MapViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import MapKit

class MapViewController: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Text composer
        let text = DSTextComposer()
        text.add(type: .headline, text: "325 Broadway, Bayonne, NJ 07002")
        text.add(type: .subheadline, text: "15 minutes to drive")
        
        // Location
        let location = CLLocationCoordinate2D(latitude: 40.764382, longitude: -73.973045)
        
        // Map
        let map = DSMapVM(text: text, coordinate: location)
        
        // Show
        show(content: map)
        
        // Demo end
    }
}

extension MapViewController: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Map"
    }
    
    var documentSubtitle: String {
        "Map example"
    }
    
    var documentCode: String {
        """
        // Text composer
        let text = DSTextComposer()
        text.add(type: .headline, text: "325 Broadway, Bayonne, NJ 07002")
        text.add(type: .subheadline, text: "15 minutes to drive")
        
        // Location
        let location = CLLocationCoordinate2D(latitude: 40.764382, longitude: -73.973045)
        
        // Map
        let map = DSMapVM(text: text, coordinate: location)
        
        // Show
        show(content: map)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
