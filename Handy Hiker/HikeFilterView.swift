//
//  DropDownView.swift
//  Handy Hiker
//
//  Created by Emily Chandler on 10/21/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import YNDropDownMenu

class HikeFilterView: YNDropDownView {
    
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
        
    }
    
}

class HikeSortView: YNDropDownView {
    
    @IBOutlet weak var sortBy: UISegmentedControl!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.initViews()
//        sortBy.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI / 2.0));
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

