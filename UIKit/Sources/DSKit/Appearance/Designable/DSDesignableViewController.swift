//
//  DesignableViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

/// Designable view controller
public protocol DSDesignableViewController {
    var navigationController: UINavigationController? { get }
    var viewController: UIViewController { get }
    var customPresentModalAnimation: UIViewControllerAnimatedTransitioning? { get set }
    var customNavigationControllerAnimation: UIViewControllerAnimatedTransitioning? { get set }
    var customDismissModalAnimation: UIViewControllerAnimatedTransitioning? { get set }
}

/// Designable view controller extension
public extension DSDesignableViewController {
    
    /// Pop this view controller from navigation controller
    func pop() {
        
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            print("Cant find an Navigation controller to pop")
        }
    }
    
    /// Pop this view controller and go back to specific view controller in navigation controller stack
    /// - Parameter to: DesignableViewController
    func pop(to: DSDesignableViewController) {
        
        if let nav = self.viewController.navigationController {
            nav.popToViewController(to.viewController, animated: true)            
        } else {
            print("Cant find an Navigation controller to pop")
        }
    }
    
    /// Pop to root view controller
    func popToRoot() {
        
        if let nav = self.viewController.navigationController {
            nav.popToRootViewController(animated: true)
        } else {
            print("Cant find an Navigation controller to pop")
        }
    }
    
    /// Push new view controller in current view controller navigation controller
    /// - Parameters:
    ///   - controller: DesignableViewController
    ///   - animated: Bool
    func push(_ controller: DSDesignableViewController, animated: Bool = true) {
        
        if let nav = self.navigationController {
            nav.pushViewController(controller.viewController, animated: animated)
        } else {
            print("Cant find an Navigation controller to push")
        }
    }
    
    /// Presents an view controller by initializing an navigation controller and set
    /// the presented view controller as root view controller
    /// - Parameters:
    ///   - vc: View controller to be encapsulated in an BaseNavigationController
    ///   - presentationStyle: UIModalPresentationStyle
    func presentInNavigationController(vc: DSDesignableViewController, presentationStyle: UIModalPresentationStyle = .overFullScreen) {
        
        let navVC = DSNavigationViewController(rootViewController: vc.viewController)
        navVC.modalPresentationStyle = presentationStyle
        self.viewController.present(navVC, animated: true, completion: nil)
    }
    
    /// Present new view controller
    /// - Parameters:
    ///   - vc: DesignableViewController
    ///   - presentationStyle: UIModalPresentationStyle
    func present(vc: DSDesignableViewController, presentationStyle: UIModalPresentationStyle = .overFullScreen) {
        
        vc.viewController.modalPresentationStyle = presentationStyle
        self.viewController.present(vc.viewController, animated: true, completion: nil)
    }
    
    func presentVC(vc: UIViewController, presentationStyle: UIModalPresentationStyle = .overFullScreen) {
        
        vc.modalPresentationStyle = presentationStyle
        self.viewController.present(vc, animated: true, completion: nil)
    }
    
    /// Dismiss an navigation controller
    func dismissNavigationController() {
        
        if let nav = viewController.navigationController {
            nav.dismiss(animated: true, completion: nil)
        } else {
            print("Can't find nav vc to dismiss")
        }
    }
    
    /// Dismiss view controller
    func dismiss() {
        self.viewController.dismiss(animated: true, completion: nil)
    }
}
