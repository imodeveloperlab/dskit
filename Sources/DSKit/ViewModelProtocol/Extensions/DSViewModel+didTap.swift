//
//  DSViewModel+DidTap.swift
//  DSKit
//
//  Created by Borinschi Ivan on 27.01.2021.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import Foundation

public extension Array where Element == DSViewModel {
    
    /// Generic function that helps to map  tap action
    /// on array of view models
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    func didTap<T: DSViewModel>(_ tap: @escaping ((T) -> Void)) -> [DSViewModel] {
        
        let array = self.map { (viewModel) -> DSViewModel in
            
            var viewModel = viewModel
            
            viewModel.didTap = { model in
                guard let model = model as? T else { return }
                tap(model)
            }
            
            return viewModel
        }
        
        return array
    }
    
    /// Handle did tap  action
    /// on array of view models
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    func didTap(_ tap: @escaping ((DSViewModel) -> Void)) -> [DSViewModel] {
        
        let array = self.map { (viewModel) -> DSViewModel in
            
            var viewModel = viewModel
            
            viewModel.didTap = { model in
                tap(model)
            }
            
            return viewModel
        }
        
        return array
    }
    
    /// Generic function that helps to map  tap action
    /// on array of view models
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    func didTapObject<T>(_ tap: @escaping ((T) -> Void)) -> [DSViewModel] {
        
        let array = self.map { (viewModel) -> DSViewModel in
            
            var viewModel = viewModel
            
            viewModel.didTap = { model in
                guard let object = model.object as? T else { return }
                tap(object)
            }
            
            return viewModel
        }
        
        return array
    }
}

public extension DSViewModel {
    
    /// Generic function that helps to map  tap action on a view model
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    mutating func didTap<T: DSViewModel>(_ tap: @escaping ((T) -> Void)) {
        
        didTap = { model in
            guard let model = model as? T else { return }
            tap(model)
        }
    }
    
    /// Generic function that helps to map  tap action on a view model object
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    mutating func didTapObject<T>(_ tap: @escaping ((T) -> Void)) {
        
        didTap = { model in
            guard let object = model.object as? T else { return }
            tap(object)
        }
    }
    
    /// Generic function that helps to map  tap action on a view model
    /// - Parameter tap: Tap closure
    /// - Returns: array of mapped  [DSViewModel]
    mutating func didTap(_ tap: @escaping ((DSViewModel) -> Void)) {
        
        didTap = { model in
            tap(model)
        }
    }
}
