//
//  HikeInfoController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/4/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit

class HikeInfoController:UIViewController
{
    
    @IBOutlet weak var HikeName: UILabel!
    @IBOutlet weak var UIImage: UIImageView!
    
    var name = ""
    var time = 0
    var byuDistance = 0
    var hikeDistance = 0
    var hikeDesc = ""
    var saved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        HikeName.text = name
    }
}
