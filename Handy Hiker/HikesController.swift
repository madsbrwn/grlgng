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
        if (self.tableView == nil) {
            print("Nil lol1111")
        }
        else {
            print("not nil")
        }
    }
    
    func reloadHikes()
    {
//        loadView()
        print("this got called")
        names.removeAll()
        times.removeAll()
        driveTimes.removeAll()
        lengths.removeAll()
        hikes = sharedModel.getHikesUnderTime(time: minutes)
        
//        self.hikes.sort(by: {$0.name < $1.name})
        
        for (hike) in hikes
        {
            names.append(hike.name)
            times.append(sharedModel.buildTimeText(time: hike.totalMinutes))
            driveTimes.append(sharedModel.buildTimeText(time: hike.minutesFromBYU))
            lengths.append(String(hike.trailLength))
        }
//        [self.tableView?.reloadData]
//        while (self.tableView == nil) {
//            print("Nil lol")
//        }
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateCounting), userInfo: nil, repeats: true)
        timer.invalidate()
        DispatchQueue.main.async{
            self.tableView?.reloadData()
        }
    }
    
    @objc func updateCounting(){
        print("doing this")
        if (self.tableView == nil) {
            print("noooo")
        }
        DispatchQueue.main.async{
            self.tableView?.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (self.tableView == nil) {
            print("wa Nil lol")
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if (self.tableView == nil) {
            print("wd Nil lol")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if (self.tableView == nil) {
            print("dd Nil lol")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (self.tableView == nil) {
            print("1 Nil lol1111")
        }
        else {
            print("1 not nil")
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
        
        if (self.tableView == nil) {
            print("2 Nil lol1111")
        }
        else {
            print(" 2 not nil")
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
        if (self.tableView == nil) {
            print("view did appear and its Nil lol1111")
        }
        else {
            print("view did appear not nil")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let hikeInfoView = segue.destination as? HikeDetailController
        {
            let selectedCell = sender as! TableViewCell
            hikeInfoView.hike = sharedModel.hikes[(selectedCell.HikeName?.text)!]
        }
        if (self.tableView == nil) {
            print("4 Nil lol1111")
        }
        else {
            print(" 4 not nil")
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
        if (self.tableView == nil) {
            print("5 Nil lol1111")
        }
        else {
            print("5 not nil")
        }
    }
}

