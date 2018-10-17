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

    // MARK: Outlets
    
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var offsetLabel: UILabel!
    @IBOutlet weak var pageLabel: UILabel!

    // MARK: Properties

    var previousBarButton: UIBarButtonItem?
    var nextBarButton: UIBarButtonItem?
    
    private var viewControllers = [UIViewController]()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        // configure the bar
        self.bar.items = [Item(title: "Info"),
                          Item(title: "Map")]
        
        
        self.bar.location = .top
        
        self.bar.appearance?.layout.itemDistribution = .centered
        self.bar.appearance?.style.background = .solid(color: UIColor(rgb: 0x579C87))
        self.bar.appearance?.indicator.color = UIColor(rgb: 0xffffff)
        
        self.bar.appearance = PresetAppearanceConfigs.forStyle(self.bar.style, currentAppearance: self.bar.appearance)
        
//        addBarButtons()
//
////        bar.style = .custom(type: CustomTabmanBar.self) // uncomment to use CustomTabmanBar as style.
////        bar.appearance = PresetAppearanceConfigs.forStyle(self.bar.style, currentAppearance: self.bar.appearance)
//
//        // updating
//        updateAppearance(pagePosition: currentPosition?.x ?? 0.0)
//        updateStatusLabels()
//        updateBarButtonStates(index: currentIndex ?? 0)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
//        segue.destination.transitioningDelegate = self
        
//        if let navigationController = segue.destination as? SettingsNavigationController,
//            let settingsViewController = navigationController.viewControllers.first as? SettingsViewController {
//            settingsViewController.tabViewController = self
//        }
//

        
//        // use current gradient as tint
//        if let navigationController = segue.destination as? UINavigationController,
//            let navigationBar = navigationController.navigationBar as? TransparentNavigationBar {
//            navigationBar.tintColor = UIColor(rgb: 0x579C87)
//        }
    }
    
    // MARK: Actions
    
    @objc func firstPage(_ sender: UIBarButtonItem) {
        scrollToPage(.first, animated: true)
    }
    
    @objc func lastPage(_ sender: UIBarButtonItem) {
        scrollToPage(.last, animated: true)
    }
    
    // MARK: PageboyViewControllerDataSource

    private func initializeViewControllers(count: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        var viewControllers = [UIViewController]()
        var barItems = [Item]()
        
        let infoTabController = storyboard.instantiateViewController(withIdentifier: "ChildViewController1") as! InfoTabController
        infoTabController.index = 0
        barItems.append(Item(title: "Info"))
        viewControllers.append(infoTabController)
        
        let mapTabController = storyboard.instantiateViewController(withIdentifier: "ChildViewController2") as! MapTabController
        mapTabController.index = 0
        barItems.append(Item(title: "Info"))
        viewControllers.append(mapTabController)
        
        bar.items = barItems
        self.viewControllers = viewControllers
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
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
