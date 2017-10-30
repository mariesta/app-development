//
//  ViewController.swift
//  Map
//
//  Created by Marie Starck on 2017-10-30.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager:CLLocationManager!
    
    var currentLocation:MKPointAnnotation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lat:CLLocationDegrees = 37.390993
        let long:CLLocationDegrees = -5.995584
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let coworkingSpacelocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let spanRegion:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let regionObj:MKCoordinateRegion = MKCoordinateRegionMake(coworkingSpacelocation, spanRegion)
        map.setRegion(regionObj, animated: false)
        
        let coworking = MKPointAnnotation()
        currentLocation = MKPointAnnotation()
        coworking.coordinate = coworkingSpacelocation
        coworking.title = "WorkIn Coworking Space"
        coworking.subtitle = "Worked there for a month"
        map.addAnnotation(coworking)
        
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0] as CLLocation
        
       // GTo stop listening for location updates
        // manager.stopUpdatingLocation()
        let userCurrentLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        print(location.coordinate.latitude)
        print(location.coordinate.longitude)
        currentLocation.coordinate = userCurrentLocation
        currentLocation.title = "User's Current Location"
        map.addAnnotation(currentLocation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

