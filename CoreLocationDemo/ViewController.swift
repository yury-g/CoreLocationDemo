//
//  ViewController.swift
//  CoreLocationDemo
//
//  Created by Yury Gitman on 10/24/16.
//  Copyright © 2016 com.yuryg. All rights reserved.
//

import UIKit
import CoreLocation  //import


class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager: CLLocationManager?  //instance var for manager
    var startLocation: CLLocation?          // object that holds location data
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    
           locationManager = CLLocationManager()  // create location Manager
        locationManager?.delegate = self    // set delegate to self. 
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest // effects battery life.
        locationManager?.requestAlwaysAuthorization()   //doesn't show blue top bar when app in background
//        locationManager?.requestWhenInUseAuthorization() // shows blue top bar when app in background
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    // LocationManger Delelgate Protocol
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways{  // check user given permisson status
            
            locationManager?.startUpdatingLocation()  // Start
            locationManager?.allowsBackgroundLocationUpdates = true
        }
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if startLocation == nil{
                startLocation = locations.first   // if don't have a start location
        } else {
            guard let latest = locations.first   //grabs latest location (if have a start location_
                else {return}                   // return "guard" if don't have latest location
            
            let distanceInMeters = startLocation?.distance(from: latest)  //get a CL object representing distance btw 1st and latest.
            print("distance in meters: \(distanceInMeters!)")  // print it.
                
            
        }
    }
    
    
    
}

