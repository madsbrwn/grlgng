//
//  FirstViewController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 9/24/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class HikesController: UIViewController
{
//    var ref : DatabaseReference?
    @IBOutlet weak var timeLimitUI: UILabel!
    var timeLimit : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLimitUI.text = timeLimit
        // Do any additional setup after loading the view, typically from a nib.
        
//        ref = Database.database ().reference()
    }
}

