//
//  WebDocuments.swift
//  DSKit
//
//  Created by Borinschi Ivan on 05.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation
import UIKit
import DSKit

extension DocumentsGroups {
    
    func sections(presenter: DSViewController) -> [DSSection] {
        
        var sections = [DSSection]()
        
        let groups = documentGroups()
        
        for group in groups {
            sections.append(group.section(presenter: presenter))
        }
        
        return sections
    }
}

extension DocumentsGroup {
    
    func section(presenter: DSViewController) -> DSSection {
        
        var viewModels = [DSViewModel]()
        
        for document in documents {
            viewModels.append(document.viewModel(presenter: presenter))
        }
        
        return viewModels.list().headlineHeader(title)
    }
}

extension Documentable {
    
    func viewModel(presenter: DSViewController) -> DSViewModel {
        
        let composer = DSTextComposer()
        composer.add(type: .text(font: .headlineWithSize(13), color: .headline), text: documentSubtitle)
        
        var action = DSActionVM(composer: composer)
        action.rightArrow()
        
        action.didTap = { (_:DSViewModel) in
            
            guard let documentViewController = documentViewController as? DSDesignableViewController else {
                return
            }
            
            presenter.push(documentViewController)
        }
        
        return action
    }
}
