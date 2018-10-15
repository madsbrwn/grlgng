
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
    @IBOutlet var timePicker: UIDatePicker?
    
    private var timeLim : TimeInterval?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker?.countDownDuration = 0100
        nextBtn?.layer.cornerRadius = 6
        nextBtn?.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let hikesView = segue.destination as? HikesController
        {
            if sender as! UIButton == skipBtn
            {
                hikesView.minutes = 0
            }
            else
            {                
                hikesView.minutes = NSInteger(timePicker?.countDownDuration ?? 0) / 60
            }
        }
    }
}
