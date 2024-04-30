//
//  BaseNavigationViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

open class DSNavigationViewController: UINavigationController, DSDesignableViewController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate, UINavigationBarDelegate {
    
    /// DesignableViewController protocol
    public var viewController: UIViewController {
        return self
    }
    
    
    /// DesignableViewController protocol
    public var customDismissModalAnimation: UIViewControllerAnimatedTransitioning?
    public var customPresentModalAnimation: UIViewControllerAnimatedTransitioning?
    public var customNavigationControllerAnimation: UIViewControllerAnimatedTransitioning?
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad() {
        
        super.viewDidLoad()
        overrideUserInterfaceStyle = DSAppearance.shared.userInterfaceStyle
        if self.customNavigationControllerAnimation != nil {
            self.delegate = self
        }
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Custom transition
    
    public func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        
        if viewController is DSDesignableViewController {
            
            if let viewController = viewController as? DSDesignableViewController {
                self.customNavigationControllerAnimation = viewController.customNavigationControllerAnimation
            }
        } else {
            self.customNavigationControllerAnimation = nil
        }
    }
    
    public func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customNavigationControllerAnimation
    }
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customPresentModalAnimation
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customDismissModalAnimation
    }
    
    // MARK: - Status Bar
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return DSAppearance.shared.main.statusBarStyle(for: traitCollection.userInterfaceStyle )
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
    
    // MARK: - Init / SetUp
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view.backgroundColor = DSAppearance.shared.main.primaryView.background
        transitioningDelegate = self
        setUpNavigationBarAppearance()
    }
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        view.backgroundColor = DSAppearance.shared.main.primaryView.background
        transitioningDelegate = self
        setUpNavigationBarAppearance()
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
}

extension UINavigationController {
    
    public func setUpNavigationBarAppearance() {
        
        overrideUserInterfaceStyle = DSAppearance.shared.userInterfaceStyle
        
        let appearance = DSAppearance.shared.main
        let navColors = appearance.navigationBar
        
        view.backgroundColor = appearance.primaryView.background
        navigationBar.tintColor = navColors.buttons
        navigationBar.barTintColor = navColors.bar
        navigationBar.isTranslucent = DSAppearance.shared.main.navigationBar.translucent
        
        toolbar.isTranslucent = DSAppearance.shared.main.navigationBar.translucent
        toolbar.barTintColor = navColors.bar
        toolbar.tintColor = navColors.buttons
        
        navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: navColors.text]
        
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: navColors.text,
                                             NSAttributedString.Key.font: appearance.fonts.headline]
    }
}

extension UINavigationController {
    
    // MARK: - Status Bar
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return DSAppearance.shared.main.statusBarStyle(for: traitCollection.userInterfaceStyle)
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return visibleViewController
    }
}
