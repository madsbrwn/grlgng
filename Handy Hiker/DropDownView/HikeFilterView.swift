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
    @IBOutlet var sortByLength: UIButton!
    @IBOutlet var sortByDistance: UIButton!
    @IBOutlet var sortByDiff: UIButton!
    @IBOutlet var sortByTime: UIButton!
    @IBOutlet var sortByName: UIButton!
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        

        self.initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
        print("init hike filter view")
        print(sharedModel.sortBy)
    }
    override func dropDownViewClosed() {
        sharedModel.hikesController?.reloadHikes()
    }
    
    override func dropDownViewOpened() {
        let sortBy = sharedModel.sortBy
        
        if (sortBy == "name"){
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
    }
    @IBAction func nameButtonClicked(_ sender: Any) {
        print("Name button clicked")
        sharedModel.sortBy = "name"
        print(sharedModel.sortBy)
        nameSelected()
        self.hideMenu()
    }
   
    @IBAction func lengthButtonClicked(_ sender: Any) {
        print("Length Button Clicked")
        sharedModel.sortBy = "length"
        lengthSelected()
        self.hideMenu()
    }
    
    @IBAction func distButtonClicked(_ sender: Any) {
        sharedModel.sortBy = "dist"
        distSelected()
        self.hideMenu()
    }
    @IBAction func diffButtonClicked(_ sender: Any) {
        sharedModel.sortBy = "diff"
        diffSelected()
        self.hideMenu()
    }
    @IBAction func timeButtonClicked(_ sender: Any) {
        sharedModel.sortBy = "time"
        timeSelected()
        self.hideMenu()
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
        sortByLength.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDistance.backgroundColor = UIColor.white
        sortByDiff.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func distSelected() {
        sortByDistance.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByLength.backgroundColor = UIColor.white
        sortByDiff.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func diffSelected() {
        sortByDiff.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDistance.backgroundColor = UIColor.white
        sortByLength.backgroundColor = UIColor.white
        sortByTime.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
    func timeSelected() {
        sortByTime.backgroundColor = UIColor(red: 233/255, green: 233/255, blue: 233/255, alpha: 1)
        sortByDiff.backgroundColor = UIColor.white
        sortByDistance.backgroundColor = UIColor.white
        sortByLength.backgroundColor = UIColor.white
        sortByName.backgroundColor = UIColor.white
    }
    
}

