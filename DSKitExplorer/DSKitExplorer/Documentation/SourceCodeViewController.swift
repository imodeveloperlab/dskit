//
//  SourceCodeViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 25.01.2021.
//

import UIKit
import DSKit
import Splash

class SourceCodeViewController: DSViewController {
    
    let code: String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Source Code"
        show(content: DSActionVM.code(codeString: code, traitCollection.userInterfaceStyle))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    init(code: String) {
        self.code = code
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // Demo end
    }
}
