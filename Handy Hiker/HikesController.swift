//
//  FirstViewController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 9/24/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit
//import CZPicker
import YNDropDownMenu
import FirebaseCore
import FirebaseDatabase


class TableViewCell : UITableViewCell
{
    @IBOutlet weak var HikeName: UILabel!
    
    @IBOutlet weak var HikeTime: UILabel!
    @IBOutlet weak var HikeLength: UILabel!
    @IBOutlet weak var DriveTime: UILabel!
    @IBOutlet weak var HikeDiff: UIImageView!
    
}

class HikesController: UIViewController, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var timeLimitUI: UILabel?


    
    var minutes : Int = 0
    var hikes : [Model.HikeObject] = []
    
    var names : [String] = []
    var times : [String] = []
    var driveTimes : [String] = []
    var lengths : [String] = []
    
    override func viewDidLoad()
    {
        sharedModel.hikesController = self
        
        callHikeFilter()
        
        super.viewDidLoad()
        
        hikes = sharedModel.getHikesUnderTime(time: minutes)
        
//        self.hikes.sort(by: {$0.name < $1.name})
        
        for (hike) in hikes
        {
            names.append(hike.name)
            times.append(sharedModel.buildTimeText(time: hike.totalMinutes))
            driveTimes.append(sharedModel.buildTimeText(time: hike.minutesFromBYU))
            lengths.append(String(hike.trailLength))
        }
        
        timeLimitUI?.text = sharedModel.buildTimeText(time: minutes)
    }
    
    func reloadHikes()
    {
        names.removeAll()
        times.removeAll()
        driveTimes.removeAll()
        lengths.removeAll()
        hikes = sharedModel.getHikesUnderTime(time: minutes)
        print("when the hikes reload")
        print(sharedModel.sortBy)
        for (hike) in hikes
        {
            names.append(hike.name)
            times.append(sharedModel.buildTimeText(time: hike.totalMinutes))
            driveTimes.append(sharedModel.buildTimeText(time: hike.minutesFromBYU))
            lengths.append(String(hike.trailLength))
        }

        DispatchQueue.main.async{
            self.tableView?.reloadData()
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (names.count > 0)
        {
            tableView.separatorStyle = .singleLine
//            numOfSections            = 1
            tableView.backgroundView = nil
        }
        else
        {
            let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
            noDataLabel.text          = "No hikes available"
            noDataLabel.textColor     = UIColor.black
            noDataLabel.textAlignment = .center
            tableView.backgroundView  = noDataLabel
            tableView.separatorStyle  = .none
        }
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell

        
        cell.HikeName?.text = names[indexPath.row]
        cell.HikeTime?.text = times[indexPath.row]
        cell.DriveTime.text = driveTimes[indexPath.row]
        cell.HikeLength?.text = lengths[indexPath.row] + " mi"
        
        cell.HikeName.numberOfLines = 1
//        cell.HikeName.minimumScaleFactor = 3.0
        cell.HikeName.adjustsFontSizeToFitWidth = true
        
        if (hikes[indexPath.row].difficulty == 0) {
            cell.HikeDiff.image = #imageLiteral(resourceName: "easy")
        }
        else if (hikes[indexPath.row].difficulty == 1) {
            cell.HikeDiff.image = #imageLiteral(resourceName: "mediu")
        }
        else if (hikes[indexPath.row].difficulty == 2) {
            cell.HikeDiff.image = #imageLiteral(resourceName: "hard")
        }
        
        return cell
    }


    override func viewDidAppear(_ animated: Bool)
    {
        if let indexPath = tableView?.indexPathForSelectedRow
        {
            tableView?.deselectRow(at: indexPath, animated: true)
        }
        reloadHikes()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let hikeInfoView = segue.destination as? HikeDetailController
        {
            let selectedCell = sender as! TableViewCell
            hikeInfoView.hike = sharedModel.hikes[(selectedCell.HikeName?.text)!]
        }
    }
    
    func callHikeFilter()
    {
        let ZBdropDownViews = Bundle.main.loadNibNamed("HikeFilterView", owner: nil, options: nil) as? [UIView]
        let FFA409 = UIColor.init(red: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)
        
        if let _ZBdropDownViews = ZBdropDownViews
        {
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 173, width: UIScreen.main.bounds.size.width, height: 35), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Filter", "Sort By"])
            
            view.setLabelColorWhen(normal: .white, selected: FFA409, disabled: .gray)
            
            view.setLabelFontWhen(normal: .systemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 12), disabled: .systemFont(ofSize: 12))
            
            view.backgroundBlurEnabled = true
            view.bottomLine.isHidden = false
            let backgroundView = UIView()
            backgroundView.backgroundColor = .black
            view.blurEffectView = backgroundView
            view.blurEffectViewAlpha = 0.7
            
            view.setBackgroundColor(color: UIColor(red: 35.0 / 255.0, green: 61.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0))
            
            self.view.addSubview(view)
        }
    }
}

