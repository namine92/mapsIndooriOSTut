//
//  ViewController.swift
//  mapsIndoorTest
//
//  Created by Amine on 08/05/2017.
//  Copyright © 2017 MacBookPro. All rights reserved.
//

import UIKit
import GoogleMaps
import MapsIndoors


class ViewController: UIViewController, MPRoutingProviderDelegate, MPMapControlDelegate {

    var mapView  : GMSMapView?;
    var  myMapControl = MPMapControl()

    
    func infoSnippetTapped(_ location: MPLocation!, tapPosition position: String!){
        
        if position == kTapPositionRIGHT {
            // Tapped on right side of info snippet
        }
        else if position == kTapPositionCENTER {
            // If tapped on the location name
        }
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupMapIndoor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

    
    
    func setupMapIndoor() {
        
        // put the camera on the venue location
        let camera = GMSCameraPosition.camera(withLatitude: 57.08585, longitude: 9.95751, zoom: 17)

        //init the google maps
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // init the MapControl
        let clientId = "550c26a864617400a40f0000";
        let myMapControl = MPMapControl.init(map: mapView)!
        
        myMapControl.setupMap(with: clientId)
        
        myMapControl.delegate = self
        
        // adding a display rule
        myMapControl.add(MPLocationDisplayRule(name: "info", andIcon: UIImage(named : "info"), andZoomLevelOn: 17))
        

        // routing
        let origin = MPLocation.init(point: MPPoint.init(lat: 57.08585, lon: 9.95751), andName: "My location")
        
        let destination = MPLocation.init(point: MPPoint.init(lat: 57.0853743, lon: 9.957698), andName: "Destination")
        
        let directionsService = MPDirectionsService.init(mapsIndoorsSolutionId: clientId, googleApiKey: "AIzaSyBMCmBVAH-tBxgA-hQ2Y25c9CzcKmlouDI")!
        directionsService.delegate = self as MPRoutingProviderDelegate ;
        directionsService.routing(from: origin, to: destination, by: "WALKING")
        
        // restriction when doing the routing
        let restrictions = ["stairs"]

        directionsService.routing(from: origin, to: destination, by: "WALKING", avoid: restrictions, depart: nil, arrive: nil)
        

       
        
}
    
    func onRouteResultReady(_ route: MPRoute!) {
        //showing the route on the map
        route.add(toMap: mapView, highlightFloor: 0)
        
    }
    
    
    func onLocationsReady(_ locationData: MPLocationDataset!){
        
        
        
    }
    
    
    func solutionDataReady(_ solution: MPSolution!){
        
        

        
        
    }
    
    public func venueDataReady( _ venueCollection: MPVenueCollection!) {
        
        
    }

    
    
    public func appDataReady(_ appData: MPAppData!) {
        
        
    }
    

    
    public func locationDataReady(_ locations: MPLocationDataset!){
        
        
    }
    
    
    
}
