//
//  ViewController.swift
//  Memorable Places
//
//  Created by Marie Starck on 2017-10-30.
//  Copyright © 2017 Marie Starck. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var manager:CLLocationManager!
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        let uipg = UITapGestureRecognizer(target: self, action: #selector(addMemorablePlaces(sender: )))
        map.addGestureRecognizer(uipg)
        print("finish loading")
    }
    
    @objc func addMemorablePlaces(sender: UIGestureRecognizer) {
        print("Action Made")
        if sender.state == UIGestureRecognizerState.began {
            let touchPoint = sender.location(in: self.map)
            let newCoordinate = self.map.convert(touchPoint, toCoordinateFrom: self.map)
            let annotation = MKPointAnnotation()
            annotation.coordinate = newCoordinate
            annotation.title = "User's location"
            self.map.addAnnotation(annotation)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        let latitude = userLocation.coordinate.latitude
        let longitude = userLocation.coordinate.longitude
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

