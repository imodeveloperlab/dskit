//
//  ViewController.swift
//  DSKitExplorer
//
//  Created by Ivan Borinschi on 08.02.2022.
//

import UIKit
import DSKit

class ViewController: DSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Components"
        let groups = DocumentsGroups()
        self.show(content: groups.sections(presenter: self))
    }
}
