//
//  DropDownView.swift
//  Handy Hiker
//
//  Created by Emily Chandler on 10/21/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import YNDropDownMenu

class HikeFilterView: YNDropDownView {
    
    @IBOutlet weak var diffPicker: UISegmentedControl?
    @IBOutlet weak var lengthSlider: UISlider?

    @IBOutlet weak var applyBtn: UIButton?
    @IBOutlet weak var clearBtn: UIButton!
    
    @IBAction func indexChanged(_ sender: UISegmentedControl) {
        guard let diffPicker = diffPicker else {return}
        switch diffPicker.selectedSegmentIndex
        {
        case 0:
            sharedModel.updateFilterDiff(diff: 0)
            break
        case 1:
            sharedModel.updateFilterDiff(diff: 1)
            break
        case 2:
            sharedModel.updateFilterDiff(diff: 2)
            break
        default:
            break
        }
    }
    @IBAction func sliderMoved(sender: UISlider) {
        guard let lengthSlider = lengthSlider else{return}
        sender.setValue(Float(lroundf(lengthSlider.value)), animated: true)
        sharedModel.updateFilterLength(length: lengthSlider.value * 3)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    
    override func dropDownViewClosed() {
        sharedModel.hikesController?.reloadHikes()
    }
    
    @IBAction func onlyJeonseButtonClicked(_ sender: Any) {
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
//        HikesController().reloadHikes()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        sharedModel.filterByLength = 30
        sharedModel.filterByDiff = -1
        diffPicker?.selectedSegmentIndex = -1
        lengthSlider?.setValue(Float(4), animated: true)
        self.hideMenu()
    }
    func initViews() {
        applyBtn?.layer.cornerRadius = 6
        applyBtn?.clipsToBounds = true
        guard let lengthSlider = lengthSlider else
        {
            sharedModel.filterByDiff = -1
            sharedModel.filterByLength = 30
            return
        }
        if (sharedModel.filterByDiff != -1)
        {
//            [diffPicker, setSelectedSegmentIndex,:sharedModel.filterByDiff]
        }
        if (sharedModel.filterByLength != 30)
        {
            lengthSlider.value = sharedModel.filterByLength
        }
    }
}

class HikeSortView: YNDropDownView {
    @IBOutlet var sortByLength: UIButton!{
        didSet {
            NSLog("sceneController set to %@", sortByLength);
        }
    }
    @IBOutlet var sortByDistance: UIButton!
    @IBOutlet var sortByDiff: UIButton!
    @IBOutlet var sortByTime: UIButton!
    @IBOutlet var sortByName: UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        let sortBy = sharedModel.sortBy
        if (sortBy == "name"){
            print("this is it homei")
            nameSelected()
        }
        else if (sortBy == "length"){
            lengthSelected()
        }
        else if (sortBy == "dist"){
            distSelected()
        }
        else if (sortBy == "diff"){
            diffSelected()
        }
        else if (sortBy == "time"){
            timeSelected()
        }

        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
    }
    override func dropDownViewClosed() {
        sharedModel.hikesController?.reloadHikes()
    }
    @IBAction func nameButtonClicked(_ sender: Any) {
        nameSelected()
        sharedModel.sortBy = "name"
    }
    @IBAction func lengthButtonClicked(_ sender: Any) {
        lengthSelected()
        sharedModel.sortBy = "length"
    }
    @IBAction func distButtonClicked(_ sender: Any) {
        distSelected()
        sharedModel.sortBy = "dist"
    }
    @IBAction func diffButtonClicked(_ sender: Any) {
        diffSelected()
        sharedModel.sortBy = "diff"
    }
    @IBAction func timeButtonClicked(_ sender: Any) {
        timeSelected()
        sharedModel.sortBy = "time"
    }
    
    @IBAction func onlyJeonseButtonClicked(_ sender: Any) {
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    func initViews() {

        

    }
    
    func nameSelected() {
        sortByLength.backgroundColor = UIColor.white
        sortByDistance.backgroundColor = UIColor.white
        sortByDiff.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
    }
    
    func lengthSelected() {
//        normal()
//        sortByLength.setTitleColor(.white, for: .normal)
        sortByLength.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDistance.backgroundColor = UIColor.white
        sortByDiff.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func distSelected() {
//        normal()
//        sortByDistance.setTitleColor(.white, for: .normal)
        sortByDistance.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByLength.backgroundColor = UIColor.white
        sortByDiff.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func diffSelected() {
//        normal()
//        sortByDiff.setTitleColor(.white, for: .normal)
        sortByDiff.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDistance.backgroundColor = UIColor.white
        sortByLength.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func timeSelected() {
//        normal()
//        sortByTime.setTitleColor(.white, for: .normal)
        sortByTime.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDiff.backgroundColor = UIColor.white
        sortByDistance.backgroundColor = UIColor.white
        sortByLength.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func normal() {
        sortByLength.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
        sortByTime.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
        sortByDiff.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
        sortByDistance.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
        sortByLength.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
        sortByName.titleLabel?.textColor = UIColor(red: 87, green: 156, blue: 135, alpha: 1)
    }
    
}

