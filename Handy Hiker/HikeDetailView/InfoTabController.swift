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
    @IBOutlet weak var UICompleteBtn: UIButton!
    @IBOutlet weak var UICheckImg: UIImageView!
    
    var hikeName = ""
    var hikeDesc = ""
    var completed = false

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setHikeDesc(desc: String)
    {
        hikeDesc = desc
        UIHikeInfo.text = hikeDesc
        adjustUITextViewHeight(arg: UIHikeInfo)
    }
    
    func setCompleted(comp: Bool)
    {
        completed = comp
        
        if completed
        {
            UICompleteBtn.setTitle("Completed", for: UIControl.State.init(rawValue: 0))
            UICompleteBtn.setTitleColor(UIColor.lightGray, for: UIControl.State.init(rawValue: 0))
            UICheckImg.image = UIImage(named: "check_filled")
        }
        else
        {
            UICompleteBtn.setTitle("Tap to complete", for: UIControl.State.init(rawValue: 0))
            UICompleteBtn.setTitleColor(UIColor(rgb: 0x579C87), for: UIControl.State.init(rawValue: 0))
            UICheckImg.image = UIImage(named: "check_outline")
        }
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    @IBAction func onBtnTxtClicked(_ sender: Any) {
        let newCompleted = !completed
        
        sharedModel.updateHikeCompleted(name: hikeName, completed: newCompleted)
        setCompleted(comp: newCompleted)
    }
}

class ButtonWithImage: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if imageView != nil {
            imageEdgeInsets = UIEdgeInsets(top: 5, left: (bounds.width - 35), bottom: 5, right: 5)
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: (imageView?.frame.width)!)
        }
    }
}
