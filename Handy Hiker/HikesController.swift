//
//  FirstViewController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 9/24/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseDatabase


class TableViewCell : UITableViewCell {
    @IBOutlet weak var HikeName: UILabel!
    
    @IBOutlet weak var HikeTime: UILabel!
    @IBOutlet weak var HikeLength: UILabel!
}

class HikesController: UIViewController, UITableViewDataSource
{
    @IBOutlet weak var timeLimitUI: UILabel!
    var minutes : Int = 0
    var hikes : [Model.HikeObject] = []
    
    var names : [String] = []
    var times : [String] = []
    var lengths : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hikes = sharedModel.getHikesUnderTime(time: minutes)
        
        for (hike) in hikes
        {
            names.append(hike.name)
            times.append(buildTimeText(time: hike.baseTime))
            lengths.append(String(hike.hikeDistance))
        }
        
        timeLimitUI.text = buildTimeText(time: minutes)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        
        cell.HikeName?.text = names[indexPath.row]
        cell.HikeTime?.text = times[indexPath.row]
        cell.HikeLength?.text = lengths[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hikeInfoView = segue.destination as? HikeInfoController
        {
            let selectedCell = sender as! TableViewCell
            let hike = sharedModel.hikes[(selectedCell.HikeName.text)!]
            
            hikeInfoView.name = hike?.name ?? ""
            hikeInfoView.time = hike?.baseTime ?? 0
            hikeInfoView.byuDistance = hike?.milesFromBYU ?? 0
            hikeInfoView.hikeDistance = hike?.hikeDistance ?? 0
            hikeInfoView.hikeDesc = hike?.description ?? ""
            hikeInfoView.saved = hike?.saved ?? false
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

