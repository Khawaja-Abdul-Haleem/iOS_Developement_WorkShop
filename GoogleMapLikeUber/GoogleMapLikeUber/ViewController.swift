//
//  ViewController.swift
//  GoogleMapLikeUber
//
//  Created by Khawaja Abdul Haleem on 16/05/2023.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myMapView: GMSMapView!
    
    var myLocationMarker: GMSMarker!
    var carAnimator: CarAnimator!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        initialSetup()
        
    }
    
    func initialSetup() {
        configureMapStyle()
        myMapView.drawPath(GMSMapView.pathString)
        LocationTracker.shared.locateMeOnLocationChange { [weak self] _ in
            self?.moveCarMarker()
        }
    }
    
    func moveCarMarker() {
        if let myLocation = LocationTracker.shared.lastLocation,
           myLocationMarker == nil {
            myLocationMarker = GMSMarker(position: myLocation.coordinate)
            myLocationMarker.icon = UIImage(named: "car")
            myLocationMarker.map = self.myMapView
            carAnimator = CarAnimator(carMarker: myLocationMarker, mapView: myMapView)
            self.myMapView.updateMap(toLocation: myLocation, zoomLevel: 16)
        } else if let myLocation = LocationTracker.shared.lastLocation?.coordinate, let myLastLocation = LocationTracker.shared.previousLocation?.coordinate {
            carAnimator.animate(from: myLastLocation, to: myLocation)
     
        }
    }
    
    func configureMapStyle() {
        myMapView.mapStyle = mapStyle(style: traitCollection.userInterfaceStyle)
    }
    
    func mapStyle(style: UIUserInterfaceStyle) -> GMSMapStyle?  {
        let styleResourceName = "mapStyle\(style.rawValue)"
        guard let styleURL = Bundle.main.url(forResource: styleResourceName, withExtension: "json") else { return nil }
        
        let mapStyle = try? GMSMapStyle(contentsOfFileURL: styleURL)
        return mapStyle
        
    }
    
}

