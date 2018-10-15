//
//  CustomTabBarController.swift
//  Handy Hiker
//
//  Created by Emily Chandler on 10/15/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let selectedColor   = UIColor(red: 87.0/255.0, green: 156.0/255.0, blue: 135.0/255.0, alpha: 1.0)
        
        let appearance = UITabBarItem.appearance(whenContainedInInstancesOf: [CustomTabBarController.self])
        appearance.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: selectedColor], for: .selected)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
