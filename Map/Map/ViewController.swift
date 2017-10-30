//
//  ViewController.swift
//  Map
//
//  Created by Marie Starck on 2017-10-30.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat:CLLocationDegrees = 37.390650
        let long:CLLocationDegrees = -5.995534
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let spanRegion:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let regionObj:MKCoordinateRegion = MKCoordinateRegionMake(location, spanRegion)
        map.setRegion(regionObj, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

