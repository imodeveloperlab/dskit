//
//  QuantityPickerViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class QuantityPickerViewController: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = "Quantity Picker"
        
        var quantityPicker = action(title: "Quantity Picker", description: "Simple", icon: "list.bullet")
        quantityPicker.didTap { [unowned self] (_ :DSActionVM) in
            self.push(QuantityPickerVC())
        }
        
        show(content: [quantityPicker].list())
    }
}
