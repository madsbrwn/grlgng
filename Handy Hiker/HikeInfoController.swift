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
    
    @IBOutlet weak var UIImage: UIImageView!
    @IBOutlet weak var UIName: UILabel!
    @IBOutlet weak var UIDistance: UILabel!
    @IBOutlet weak var UILocation: UILabel!
    @IBOutlet weak var UITime: UILabel!
    @IBOutlet weak var HikeInfo: UITextView!
    
    
    var name = ""
    var time = 0
    var byuDistance = 0
    var hikeDistance = 0
    var hikeDesc = ""
    var saved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let hrs = time / 60
        let min = time % 60
        
        UIName.text = name
        UIDistance.text = String(hikeDistance) + "mi"
        UITime.text = String(hrs) + " hrs " + String(min) + " min"
        HikeInfo.text = hikeDesc
    }
}
