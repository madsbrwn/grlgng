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


class TableViewCell : UITableViewCell {
    @IBOutlet weak var HikeName: UILabel!
    
    @IBOutlet weak var HikeTime: UILabel!
    @IBOutlet weak var HikeLength: UILabel!
}

class HikesController: UIViewController, UITableViewDataSource
{
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var timeLimitUI: UILabel!
    var minutes : Int = 0
    var hikes : [Model.HikeObject] = []
    
    var names : [String] = []
    var times : [String] = []
    var lengths : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callHikeFilter()
        
        
        
        hikes = sharedModel.getHikesUnderTime(time: minutes)
        
        for (hike) in hikes
        {
            names.append(hike.name)
            times.append(buildTimeText(time: hike.totalMinutes))
            lengths.append(String(hike.trailLength))
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
        cell.HikeLength?.text = lengths[indexPath.row] + " mi"
        return cell
    }


    override func viewDidAppear(_ animated: Bool) {
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let hikeInfoView = segue.destination as? HikeDetailController
        {
            let selectedCell = sender as! TableViewCell
            hikeInfoView.hike = sharedModel.hikes[(selectedCell.HikeName?.text)!]
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
    
    func callHikeFilter() {
        let ZBdropDownViews = Bundle.main.loadNibNamed("HikeFilterView", owner: nil, options: nil) as? [UIView]
        let FFA409 = UIColor.init(red: 255/255, green: 164/255, blue: 9/255, alpha: 1.0)
        
        if let _ZBdropDownViews = ZBdropDownViews {
            // Inherit YNDropDownView if you want to hideMenu in your dropDownViews
            let view = YNDropDownMenu(frame: CGRect(x: 0, y: 173, width: UIScreen.main.bounds.size.width, height: 35), dropDownViews: _ZBdropDownViews, dropDownViewTitles: ["Filter", "Sort By"])
            
            //view.setImageWhens(normal: [UIImage(named: "HOME_BOX_NORMAL"),UIImage(named: "HOME_COLOR_NORMAL"),UIImage(named: "HOME_DESIGN_NORMAL"),UIImage(named: "HOME_CONCEPT_NORMAL")], selectedTintColorRGB: "FFA409", disabledTintColorRGB: "D3D3D3")
            
            
            view.setLabelColorWhen(normal: .white, selected: FFA409, disabled: .gray)
            
            view.setLabelFontWhen(normal: .systemFont(ofSize: 12), selected: .boldSystemFont(ofSize: 12), disabled: .systemFont(ofSize: 12))
            //            view.setLabel(font: .systemFont(ofSize: 12))
            
            view.backgroundBlurEnabled = true
            //            view.bottomLine.backgroundColor = UIColor.black
            view.bottomLine.isHidden = false
            // Add custom blurEffectView
            let backgroundView = UIView()
            backgroundView.backgroundColor = .black
            view.blurEffectView = backgroundView
            view.blurEffectViewAlpha = 0.7
            
            view.setBackgroundColor(color: UIColor(red: 35.0 / 255.0, green: 61.0 / 255.0, blue: 77.0 / 255.0, alpha: 1.0))
            
            self.view.addSubview(view)
        }
    }
}

