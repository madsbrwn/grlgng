//
//  MapViewController.swift
//  Handy Hiker
//
//  Created by Madeline Brown on 10/23/18.
//  Copyright © 2018 GrlGng. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController
{
    var coords : CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 40.248875, longitude: -111.649278)
    var hikeName : String = ""
    
    override func viewDidLoad() {
        initMap()
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
