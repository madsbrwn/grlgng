//
//  YourInfoController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/4/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit

class YourInfoController: UIViewController, UITextFieldDelegate
{
//    @IBOutlet weak var yourName: UITextField!
//    @IBOutlet weak var hikeSpeed: UISlider!
    @IBOutlet weak var hikesCompleted: UILabel!
    @IBOutlet weak var milesHiked: UILabel!
    @IBOutlet weak var timeSpentHiking: UILabel!
    
    var userInfo : UserInfo = sharedModel.userInfo
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkModel()
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        checkModel()
    }
    
//    @IBAction func sliderMoved(sender: UISlider) {
//        sender.setValue(Float(lroundf(hikeSpeed.value)), animated: true)
//    }
    
    func checkModel()
    {
//        hikeSpeed.setValue(userInfo.getSpeed(), animated: true)
        
//        yourName.text = userInfo.getName()
//        yourName.delegate = self
        
        hikesCompleted.text = String(userInfo.hikesCompleted)
        milesHiked.text = String(userInfo.milesHiked)
        
        var timeStr =  sharedModel.buildTimeText(time: userInfo.minutesSpentHiking)
        if timeStr == "any time"
        {
            timeStr = "0 hrs"
        }
        
        timeSpentHiking.text = timeStr
    }

    @IBAction func endEdit(_ sender: Any) {
//        userInfo.setName(myname: yourName.text!)
//        userInfo.setSpeed(myspeed: hikeSpeed.value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
