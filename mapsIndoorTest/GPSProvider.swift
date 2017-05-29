//
//  GPSProvider.swift
//  mapsIndoorTest
//
//  Created by Amine on 18/05/2017.
//  Copyright © 2017 MacBookPro. All rights reserved.
//

import Foundation
import MapsIndoors



class GPSPositionProvider : CLLocationManagerDelegate, MPPositionProvider {
    var isRunning : Bool
    let locationManager = CLLocationManager()

    
    init(  isRunning : Bool ){
        self.isRunning = isRunning
        
    }
    
    
    public func startPositioning() {
        
        if(!isRunning){
            isRunning = true
            
            if(!locationManager){
                locationManager = CLLocationManager()
                locationManager.delegate = self;
                locationManager.distanceFilter = 7;
                locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                }


        }
        
    }
    
    
    public func stopPositioning() {
        
        
    }
    
    
    
    public func startPositioning(_ arg: String!) {
        
    }
    
    
    public func startPositioning(after millis: Int32, arg: String!) {
        
    }
    
    public func isRunning(){
        
    }
    

    
}
