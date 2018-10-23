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
//    var index: Int?
    var coords : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.248875, longitude: -111.649278)
    var hikeName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initMap()
//        if let index = self.index {
////            self.label.text = "Page " + String(index)
////            self.promptLabel.isHidden = index != 1
//        }
    }
    
    private func initMap()
    {
        let camera = GMSCameraPosition.camera(withLatitude: coords.latitude, longitude: coords.longitude, zoom: 16.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: coords.latitude, longitude: coords.longitude)
        marker.title = hikeName
        marker.map = mapView
    }
}
