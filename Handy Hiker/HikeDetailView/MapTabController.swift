//
//  ChildViewController.swift
//  Pageboy-Example
//
//  Created by Merrick Sapsford on 13/02/2017.
//  Copyright © 2018 UI At Six. All rights reserved.
//

import UIKit
import GoogleMaps

class MapTabController: UIViewController {

//    @IBOutlet weak var label: UILabel!
//    @IBOutlet weak var promptLabel: UILabel!

    var index: Int?
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let index = self.index {
//            self.label.text = "Page " + String(index)
//            self.promptLabel.isHidden = index != 1
        }
    }
}
