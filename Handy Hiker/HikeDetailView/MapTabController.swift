//
//  ChildViewController.swift
//  Pageboy-Example
//
//  Created by Merrick Sapsford on 13/02/2017.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import GoogleMaps

class MapTabController: UIViewController
{
    @IBOutlet weak var navBtn : UIButton!
    var coords : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.248875, longitude: -111.649278)
    var hikeName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBtn?.layer.cornerRadius = 6
        navBtn?.clipsToBounds = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let mapView = segue.destination as? MapViewController
        {
            mapView.coords = self.coords
            mapView.hikeName = self.hikeName
        }
    }
}
