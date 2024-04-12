//
//  DSCollectionView+Forms.swift
//  DSKit
//
//  Created by Borinschi Ivan on 02.02.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

extension DSCollectionView {
    
    func isCurrentFormValid(_ validate: @escaping (Bool) -> Void) {

        guard !self.adaptedContent.isEmpty else {
            validate(true)
            return
        }
        
        var verifiedViewModels: Int = 0
        
        var isValid = true
        
        for section in adaptedContent {
            
            for model in section.viewModels {
                
                guard let model = model as? DSTextFieldVM else {
                    continue
                }
                
                // Request view model to validate self
                model.validateTextField?()
                
                model.isValid(text: model.text, validateEmptyTextField: false, { isViewTextFieldValid in
                    
                    verifiedViewModels += 1
                    
                    if !isViewTextFieldValid {
                        isValid = false
                    }
                    
                    if verifiedViewModels == self.adaptedContent.totalTextFieldViewModelsCount {
                        validate(isValid)
                    }
                })
            }
        }
    }
}
