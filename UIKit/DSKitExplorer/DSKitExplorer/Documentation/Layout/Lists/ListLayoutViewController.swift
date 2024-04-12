//
//  ListLayoutViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit

class ListLayoutViewController: DSViewController {
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        title = "List"
        
        var simpleList = action(title: "List", description: "Simple list", icon: "list.bullet")
        simpleList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListSimpleLayoutVC())
        }
        
        var simpleSeparatorList = action(title: "List", description: "List with separator", icon: "list.bullet")
        simpleSeparatorList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListSeparatorLayoutVC())
        }
        
        var groupedList = action(title: "List", description: "Grouped list", icon: "list.bullet")
        groupedList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListGroupedLayoutVC())
        }
        
        var groupedSeparatorList = action(title: "List", description: "Grouped list with separator", icon: "list.bullet")
        groupedSeparatorList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListGroupedAndSeparatorLayoutVC())
        }
        
        var groupedSeparatorHeaderFooterList = action(title: "List", description: "Grouped list with separator, header and footer", icon: "list.bullet")
        groupedSeparatorHeaderFooterList.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListGroupedSeparatorHeaderFooterLayoutVC())
        }
        
        var supplementaryViews = action(title: "List", description: "SupplementaryViews", icon: "list.bullet")
        
        supplementaryViews.didTap { [unowned self] (_ :DSActionVM) in
            self.push(ListWithSupplementaryItemsLayoutVC())
        }
        
        let viewModels: [DSViewModel] = [simpleList,
                                         simpleSeparatorList,
                                         groupedList,
                                         groupedSeparatorList,
                                         supplementaryViews]
        
        let section = viewModels.list()
        show(content: [section])
    }
}
