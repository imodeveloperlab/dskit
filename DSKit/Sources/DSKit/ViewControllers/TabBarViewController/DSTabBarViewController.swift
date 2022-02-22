//
//  DSTabBarViewController.swift
//  DSKit
//
//  Created by Borinschi Ivan on 30.11.2020.
//  Copyright © 2021 Borinschi Ivan. All rights reserved.
//

import UIKit

open class DSTabBarViewController: UITabBarController, UIViewControllerTransitioningDelegate, DSDesignableViewController {

    ///UIDesignableViewController protocol
    public var viewController: UIViewController {
        return self
    }
    
    ///UIDesignableViewController protocol
    public var customPresentModalAnimation: UIViewControllerAnimatedTransitioning?
    public var customNavigationControllerAnimation: UIViewControllerAnimatedTransitioning?
    public var customDismissModalAnimation: UIViewControllerAnimatedTransitioning?
    
    var progressHud: ProgressHUD!
    
    // MARK: - Lifecycle
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setUpTabBarAppearance()
        setUpProgressHud()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
       super.viewDidAppear(animated)
    }
    
    // MARK: - Custom animation
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return nil
    }
    
    // MARK: - Status Bar
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return DSAppearance.shared.main.statusBarStyle(for: traitCollection.userInterfaceStyle )
    }
    
    open override var prefersStatusBarHidden: Bool {
      return false
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return nil
    }
    
    // MARK: - Init
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        self.transitioningDelegate = self
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.transitioningDelegate = self
    }
    
    deinit {
       // print("☠ Deinit \(self)")
    }
}

extension UITabBarController {
    
    public func setUpTabBarAppearance() {
                
        overrideUserInterfaceStyle = DSAppearance.shared.userInterfaceStyle
        tabBar.unselectedItemTintColor = DSAppearance.shared.main.tabBar.unselectedItemTint
        tabBar.tintColor = DSAppearance.shared.main.tabBar.itemTint
        tabBar.barTintColor = DSAppearance.shared.main.tabBar.barTint
        tabBar.isTranslucent = DSAppearance.shared.main.tabBar.translucent
        
        //Set one badge color to all tab-bar items
        if let tabBarItems = tabBar.items {
            for item in tabBarItems {
                item.badgeColor = DSAppearance.shared.main.tabBar.badge
            }
        }
    }
}

extension DSTabBarViewController {
    
    /// Show hide loading / progress hud on current screen / context / view controller
    /// - Parameters:
    ///   - loading: true to show, false to hide
    ///   - delayShowLoading: Delay start loading is used in situations when we have some request to server
    ///   and if those requests will execute quick then we will not disturb user with our loading hud else
    ///   if request is not fast the loading will appear on screen
    ///   - file: Debug file from where is called
    ///   - line: Debug line from where is called
    public func loading(_ loading: Bool, delayShowLoading: Bool = true, file: String = #file, line: Int = #line) {
        
        guard let progressHud = self.progressHud else {
            return
        }
        
        var fileName = "No file name"
        if let file = file.components(separatedBy: "/").last {
            fileName = file
        }
        
        progressHud.loading(loading, delayShowLoading: delayShowLoading, file: fileName, line: line)
    }

    /// SetUp progress hud
    func setUpProgressHud() {
        
        /// If `current view controller` is an `UIWebViewDelegate`
        /// then we will init and set instance to `progressHud` from current view
        if let navigationController = self.navigationController {
            
            /// Else if we are at the moment in an `navigationController`
            /// then we will check if we already have an `ProgressHUD` instance
            /// on current view, if exist we will set it as instance to `progressHud`
            for view in navigationController.view.subviews where view.tag == progressHUDTag {
                
                guard let view = view as? ProgressHUD else {
                    return
                }
                progressHud = view
            }
            
            /// If we did not have already an instance of `ProgressHUD` then we will create
            /// one on current navigation `controller view`
            if progressHud == nil {
                progressHud = ProgressHUD(onView: navigationController.view)
            }
            
        } else {
            
            ///Init an `ProgressHUD` on current view
            progressHud = ProgressHUD(onView: self.view)
        }
    }
}

extension UITabBarController {
    
    // MARK: - Status Bar
    override open var preferredStatusBarStyle: UIStatusBarStyle {
        return DSAppearance.shared.main.statusBarStyle(for: traitCollection.userInterfaceStyle )
    }
    
    open override var childForStatusBarStyle: UIViewController? {
        return nil
    }
}
