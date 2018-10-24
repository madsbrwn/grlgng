//
//  HikeInfoController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/4/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit
import Tabman
import Pageboy

class HikeDetailController:UIViewController
{
    @IBOutlet weak var UIImage: UIImageView!
    @IBOutlet weak var UIName: UILabel!
    @IBOutlet weak var UIDistance: UILabel!
    @IBOutlet weak var UIDriveTime: UILabel!
    @IBOutlet weak var UITime: UILabel!

    var hike : Model.HikeObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIName.text = hike?.name
        UIDistance.text = String(hike?.trailLength ?? 0.0) + " mi"
        UIDriveTime.text = buildTimeText(time: hike?.minutesFromBYU ?? 0)
        UITime.text = buildTimeText(time: hike?.totalMinutes ?? 0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let tabView = segue.destination as? TabViewController
        {
            tabView.selectedHike = hike
        }
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
