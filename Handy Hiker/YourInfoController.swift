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
    @IBOutlet weak var yourName: UITextField!
    @IBOutlet weak var hikeSpeed: UISlider!
    
    var userInfo : UserInfo = sharedModel.userInfo
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        hikeSpeed.setValue(userInfo.getSpeed(), animated: true)
        
        yourName.text = userInfo.getName()
        yourName.delegate = self
    }

    @IBAction func endEdit(_ sender: Any) {
        userInfo.setName(myname: yourName.text!)
        userInfo.setSpeed(myspeed: hikeSpeed.value)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
