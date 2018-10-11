
//
//  TimePickerController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/4/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit

class TimePickerController: UIViewController
{
    @IBOutlet var nextBtn: UIButton?
    @IBOutlet var skipBtn: UIButton?
    
    private var timePicker: UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timePicker = UIDatePicker()
        timePicker?.addTarget(self, action: #selector(TimePickerController.timeChanged(timePicker:)), for: .valueChanged)
        timePicker?.countDownDuration = 0015
    }
    
    @objc func timeChanged(timePicker: UIDatePicker)
    {
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let hikesView = segue.destination as? HikesController
        {
            if sender as! UIButton == skipBtn
            {
                hikesView.timeLimit = "any time"
            }
            else
            {
                let timeFormatter = DateFormatter()
//                if timePicker?.date <
                timeFormatter.dateFormat = "H hours and mm minutes"
 
                hikesView.timeLimit = timeFormatter.string(from: timePicker?.date ?? Date.init())
            }
        }
    }
}
