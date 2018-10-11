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
//    var ref : DatabaseReference?
    


    @IBOutlet weak var timeLimitUI: UILabel!
    var timeLimit : String = ""
    
    let hikes = ["Mt. Timpanogos", "hike2", "hike3"]
    let times = ["30 minutes", "1 hour", "2 hours"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLimitUI.text = timeLimit


        // Do any additional setup after loading the view, typically from a nib.
        
//        ref = Database.database ().reference()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hikes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        
        cell.HikeName?.text = hikes[indexPath.row]
        cell.HikeTime?.text = hikes[indexPath.row]
        cell.HikeLength?.text = hikes[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hikeInfoView = segue.destination as? HikeInfoController
        {
            let selectedCell = sender as! UITableViewCell
            let hike = sharedModel.hikes[(selectedCell.textLabel?.text)!]
            
            hikeInfoView.name = hike?.name ?? ""
            hikeInfoView.time = hike?.time ?? 0
            hikeInfoView.byuDistance = hike?.distanceFromBYU ?? 0
            hikeInfoView.hikeDistance = hike?.hikeDistance ?? 0
            hikeInfoView.hikeDesc = hike?.description ?? ""
            hikeInfoView.saved = hike?.saved ?? false
        }
    }
}

