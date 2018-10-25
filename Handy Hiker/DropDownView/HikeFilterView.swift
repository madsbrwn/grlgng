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
    
    
    
    @IBAction func onlyJeonseButtonClicked(_ sender: Any) {
    }
    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    @IBAction func cancelButtonClicked(_ sender: Any) {
        self.hideMenu()
    }
    func initViews() {
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
    
    @IBOutlet weak var sortBy: UISegmentedControl!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
        sortBy.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2.0));
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.initViews()
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
    
}

