//
//  ViewController.swift
//  mapTry
//
//  Created by MCNLAB on 2018/5/30.
//  Copyright © 2018年 ds. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    var mapView:MKMapView = MKMapView(frame: CGRect(x:0, y:0, width:UIScreen.main.bounds.size.width, height:UIScreen.main.bounds.size.height))
    let lm = CLLocationManager()
    let annotation = MKPointAnnotation()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lm.requestAlwaysAuthorization()
        lm.delegate = self
        lm.startUpdatingLocation()
//        var userLocation = MKUserLocation()
//        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(23.5, 121)
        
    
        mapView.addAnnotation(annotation)
        self.view.addSubview(mapView)
//        mapView.setCenter(location, animated: true)
//        var region:MKCoordinateRegion = mapView.region
//        region.center = location
//        region.span.latitudeDelta = 0.02
//        region.span.longitudeDelta = 0.02
//
//        mapView.setRegion(region, animated: true)
//
//        mapView.mapType = MKMapType.standard
//        self.view.addSubview(mapView)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if locations.count > 0{
            let location = locations.first
            let location2:CLLocationCoordinate2D = CLLocationCoordinate2DMake((location?.coordinate.latitude)!, (location?.coordinate.longitude)!)
            
            annotation.coordinate = location2
            annotation.title = "您現在的位置"
            annotation.subtitle = "\(annotation.coordinate.latitude), \(annotation.coordinate.longitude)"
            
            
            mapView.setCenter(location2, animated: true)
            var region:MKCoordinateRegion = mapView.region
            region.center = location2
            region.span.latitudeDelta = 0.02
            region.span.longitudeDelta = 0.02
            mapView.setRegion(region, animated: true)
            
            mapView.mapType = MKMapType.standard
            print("latitude: \(String(describing: location?.coordinate.latitude))")
        }
    }
    func turn_off_GPS(){
        lm.stopUpdatingLocation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

