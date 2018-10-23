//
//  TabViewController.swift
//  Tabman-Example
//
//  Created by Merrick Sapsford on 04/01/2017.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController, PageboyViewControllerDataSource {

    var previousBarButton: UIBarButtonItem?
    var nextBarButton: UIBarButtonItem?
    var selectedHike : Model.HikeObject?
    
    private var viewControllers = [UIViewController]()
    private var initialized = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initializeTabBar()
        
        if let infoTabController = viewControllers[0] as? InfoTabController
        {
            infoTabController.setHikeDesc(desc: selectedHike?.description ?? "")
        }
    }
    
    
    // Tab bar initialization/functionality/etc
    
    func initializeTabBar()
    {
        self.dataSource = self
        
        self.bar.style = .buttonBar
        self.bar.appearance = PresetAppearanceConfigs.forStyle(self.bar.style, currentAppearance: self.bar.appearance)
        
        let index = 0
        self.previousBarButton?.isEnabled = index != 0
        self.nextBarButton?.isEnabled = index != (self.pageCount ?? 0) - 1
        
        if !self.initialized
        {
            initializeViewControllers()
        }
    }
    
    @objc func firstPage(_ sender: UIBarButtonItem) {
        scrollToPage(.first, animated: true)
    }
    
    @objc func lastPage(_ sender: UIBarButtonItem) {
        scrollToPage(.last, animated: true)
    }
    
    // MARK: PageboyViewControllerDataSource

    private func initializeViewControllers() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewControllers = [UIViewController]()
        var barItems = [Item]()
        
        let infoTabController = storyboard.instantiateViewController(withIdentifier: "ChildViewController1") as! InfoTabController
        infoTabController.index = 1
        barItems.append(Item(title: "Info"))
        viewControllers.append(infoTabController)

        let mapTabController = storyboard.instantiateViewController(withIdentifier: "ChildViewController2") as! MapTabController
        mapTabController.index = 2
        barItems.append(Item(title: "Map"))
        viewControllers.append(mapTabController)
        
        bar.items = barItems
        self.viewControllers = viewControllers
        self.initialized = true
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        if !self.initialized
        {
            initializeViewControllers()
        }
        return self.viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return self.viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    private var targetIndex: Int?
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                        willScrollToPageAt index: Int,
                                        direction: PageboyViewController.NavigationDirection,
                                        animated: Bool) {
        super.pageboyViewController(pageboyViewController,
                                    willScrollToPageAt: index,
                                    direction: direction,
                                    animated: animated)
        
        targetIndex = index
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                        didScrollTo position: CGPoint,
                                        direction: PageboyViewController.NavigationDirection,
                                        animated: Bool) {
        super.pageboyViewController(pageboyViewController,
                                    didScrollTo: position,
                                    direction: direction,
                                    animated: animated)
    }
    
    override func pageboyViewController(_ pageboyViewController: PageboyViewController,
                                        didScrollToPageAt index: Int,
                                        direction: PageboyViewController.NavigationDirection,
                                        animated: Bool) {
        super.pageboyViewController(pageboyViewController,
                                    didScrollToPageAt: index,
                                    direction: direction,
                                    animated: animated)
        
        self.previousBarButton?.isEnabled = index != 0
        self.nextBarButton?.isEnabled = index != (self.pageCount ?? 0) - 1
        
        targetIndex = nil
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
