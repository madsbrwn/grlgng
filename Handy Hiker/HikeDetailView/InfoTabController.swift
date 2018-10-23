//
//  ChildViewController.swift
//  Pageboy-Example
//
//  Created by Merrick Sapsford on 13/02/2017.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit

class InfoTabController: UIViewController {

    @IBOutlet weak var UIHikeInfo: UITextView!
    var index: Int?
    var hikeDesc = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setHikeDesc(desc: String)
    {
        hikeDesc = desc
        UIHikeInfo.text = hikeDesc
    }
}
