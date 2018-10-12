//
//  YourInfoController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/4/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit

class YourInfoController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate
{
    @IBOutlet weak var speedPicker: UIPickerView!
    @IBOutlet weak var yourName: UITextField!
    let speeds = ["Slow", "Medium", "Fast"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    
        self.speedPicker.delegate = self
        self.speedPicker.dataSource = self
        yourName.delegate = self
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ yourName: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return speeds.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return speeds[row]
    }
}
