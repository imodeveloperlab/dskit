//
//  SegmentViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class SegmentViewController: DSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = documentTitle
        showCode(code: documentCode)
        showDemo()
    }
    
    func showDemo() {
        
        // Demo begin
        
        // Segments
        let segments = ["Petrichor", "Sumptuous", "Angst"]
        
        // Segment controll
        let segmentControl = DSSegmentVM(segments: ["Petrichor","Sumptuous","Angst"])
        
        // Handle tap on segment
        segmentControl.didTapOnSegment = { segment in
            
            let text = DSLabelVM(.body, text: segment.title)
            
            // Update
            self.show(content: segmentControl, text)
        }
        
        // Text
        let text = DSLabelVM(.body, text: segments.first ?? "No value")
        
        // Show
        show(content: segmentControl, text)
        
        // Demo end
    }
}

extension SegmentViewController: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    var documentTitle: String {
        "Segment"
    }
    
    var documentSubtitle: String {
        "Segment control example"
    }
    
    var documentCode: String {
        """
        // Segments
        let segments = ["Petrichor", "Sumptuous", "Angst"]
        
        // Segment controll
        let segmentControl = DSSegmentVM(segments: ["Petrichor","Sumptuous","Angst"])
        
        // Handle tap on segment
        segmentControl.didTapOnSegment = { segment in
            
            let text = DSLabelVM(.body, text: segment.title)
            
            // Update
            self.show(content: segmentControl, text)
        }
        
        // Text
        let text = DSLabelVM(.body, text: segments.first ?? "No value")
        
        // Show
        show(content: segmentControl, text)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}
