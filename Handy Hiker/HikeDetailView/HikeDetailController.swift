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
    @IBOutlet weak var UIDiff: UILabel!
    
    var hike : Model.HikeObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIName.text = hike?.name
        
        UIName.numberOfLines = 1
        //        cell.HikeName.minimumScaleFactor = 3.0
        UIName.adjustsFontSizeToFitWidth = true
        UIDistance.text = String(hike?.trailLength ?? 0.0) + " mi"
        UIDriveTime.text = buildTimeText(time: hike?.minutesFromBYU ?? 0)
        UITime.text = buildTimeText(time: hike?.totalMinutes ?? 0)
        UIDiff.layer.cornerRadius = 3
        UIDiff.clipsToBounds = true
        setDiff()
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
    private func setDiff()
    {
        if (hike?.difficulty == 0)
        {
            UIDiff.text = "Easy"
            UIDiff.backgroundColor = UIColor(red: 120/255, green: 190/255, blue: 169/255, alpha: 1)
        }
        else if (hike?.difficulty == 1)
        {
            UIDiff.text = "Moderate"
            UIDiff.backgroundColor = UIColor(red: 245/255, green: 187/255, blue: 94/255, alpha: 1)
        }
        else if (hike?.difficulty == 2)
        {
            UIDiff.text = "Hard"
            UIDiff.backgroundColor = UIColor(red: 237/255, green: 125/255, blue: 114/255, alpha: 1)
        }
    }
}
