//
//  TypographyActiveTextVC.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit
import DSKit

class TypographyActiveTextVC: DSViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        title = documentTitle
        showDemo()
        showCode(code: documentCode)
    }
    
    func showDemo() {
        
        // Demo begin
        
        var activeText = DSActiveTextVM(.body, text: "An astronomical term that's been coopted for colloquial #usage, nadir means the lowest point, as in the \"nadir of her popularity.\" Its @opposite term, noreply@dskit.com zenith, has a similar appeal.")
        activeText.links = ["astronomical": "https://dskit.app"]
        
        activeText.didTapOnHashTag = { tag in
            self.show(message: "Did tap on hashtag: #\(tag)")
        }
        
        activeText.didTapOnUrl = { url in
            self.show(message: "Did tap on url:\(url.absoluteString)")
        }
        
        activeText.didTapOnEmail = { email in
            self.show(message: "Did tap on email: \(email)")
        }
        
        activeText.didTapOnMention = { mention in
            self.show(message: "Did tap on mention: @\(mention)")
        }
        
        var activeText2 = DSActiveTextVM(.body, text: "By creating your account you agree to our Terms of Use and Privacy Policy.")
        activeText2.links = ["Terms of Use": "https://dskit.app", "Privacy Policy": "https://dskit.app"]
        activeText2.linksFont = .headline
        activeText2.alignment = .center

        activeText2.didTapOnUrl = { url in
            self.show(message: "Did tap on url:\(url.absoluteString)")
        }

        show(content: activeText, activeText2)
        
        // Demo end
    }
}

extension TypographyActiveTextVC: Documentable {
    
    var documentViewController: UIViewController? {
        return self.viewController
    }
    
    
    var documentTitle: String {
        "Text"
    }
    
    var documentSubtitle: String {
        "Active text"
    }
    
    var documentCode: String {
        """
        var activeText = DSActiveTextVM(.body, text: "An astronomical term that's been coopted for colloquial #usage, nadir means the lowest point, as in the \"nadir of her popularity.\" Its @opposite term, noreply@dskit.com zenith, has a similar appeal.")
        activeText.links = ["astronomical": "https://dskit.app"]

        activeText.didTapOnHashTag = { tag in
            self.show(message: "Did tap on hashtag: #\\(tag)")
        }

        activeText.didTapOnUrl = { url in
            self.show(message: "Did tap on url:\\(url.absoluteString)")
        }

        activeText.didTapOnEmail = { email in
            self.show(message: "Did tap on email: \\(email)")
        }

        activeText.didTapOnMention = { mention in
            self.show(message: "Did tap on mention: @\\(mention)")
        }

        var activeText2 = DSActiveTextVM(.body, text: "By creating your account you agree to our Terms of Use and Privacy Policy.")
        activeText2.links = ["Terms of Use": "https://dskit.app", "Privacy Policy": "https://dskit.app"]
        activeText2.linksFont = .headline
        activeText2.alignment = .center

        activeText2.didTapOnUrl = { url in
            self.show(message: "Did tap on url:\\(url.absoluteString)")
        }

        show(content: activeText, activeText2)
        """
    }
    
    var documentMarkdownFileName: String? {
        return nil
    }
}

