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
    var byuDistance : Double = 0
    var hikeDistance : Double = 0
    var hikeDesc = ""
    var saved = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UIName.text = name
        UIDistance.text = String(hikeDistance) + "mi"
        UITime.text = buildTimeText(time: time)
        HikeInfo.text = hikeDesc
    }
    
    private func buildTimeText(time : Int) -> String
    {
        if (time == 0)
        {
            return "any time"
        }
        
        let hrs = time / 60
        let min = time % 60
        
        var str : String = ""
        
        if hrs != 0
        {
            str += String(hrs) + (hrs == 1 ? " hr " : " hrs ")
        }
        
        if min != 0
        {
            str += String(min) + " min"
        }
        
        return str
    }
}
