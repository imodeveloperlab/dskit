//
//  TypographyViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import DSKitFakery

class GridLayoutViewController: DSViewController {
    
    let faker = DSFaker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Grid"        
        
        var simple = action(title: "Grid", description: "Simple grid", icon: "rectangle.grid.2x2.fill")
        simple.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GridSimpleLayoutVC())
        }
        
        var simpleHeaderFooter = action(title: "Grid", description: "With header and footer", icon: "rectangle.grid.2x2.fill")
        simpleHeaderFooter.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GridSimpleHeaderFooterLayoutVC())
        }
        
        var grouped3Rows = action(title: "Grid", description: "3 columns grid", icon: "rectangle.grid.2x2.fill")
        grouped3Rows.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GridGrouped3RowsLayoutVC())
        }
        
        var grouped5RowsHeaderFooter = action(title: "Grid", description: "Grouped grid with 5 columns, header and footer", icon: "rectangle.grid.2x2.fill")
        grouped5RowsHeaderFooter.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GridGrouped5RowsHeaderFooterLayoutVC())
        }
        
        var supplementaryViews = action(title: "Grid", description: "Supplementary Views", icon: "rectangle.grid.2x2.fill")
        supplementaryViews.didTap { [unowned self] (_ :DSActionVM) in
            self.push(GridWithSupplementaryItemsLayoutVC())
        }
        
        let viewModels: [DSViewModel] = [simple,
                                         simpleHeaderFooter,
                                         grouped3Rows,
                                         grouped5RowsHeaderFooter,
                                         supplementaryViews]
        
        show(content: viewModels.list())
        // Demo end
    }
}


