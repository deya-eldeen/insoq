//
//  MapPickerViewController.swift
//  inSooqApp
//
//  Created by Deya on 15/04/2022.
//

import UIKit
import GoogleMaps

class MapPickerViewController: UIViewController {
    
    let locationManager = CLLocationManager()
    
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!

    static var addressDetails = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
        mapView.delegate = self
        
        locationManager.delegate = self
        mapView.isHidden = true
        addressLabel.isHidden = true
        MapPickerViewController.addressDetails = ""
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
            mapView.isMyLocationEnabled = true
            mapView.settings.myLocationButton = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    func reverseGeocode(coordinate: CLLocationCoordinate2D) {
        
        let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinate) { response, error in
            guard
                let address = response?.firstResult(),
                let lines = address.lines
            else {
                return
            }
            
            self.addressLabel.text = lines.joined(separator: "\n")
            MapPickerViewController.addressDetails = lines.joined(separator: "\n")
            
            UIView.animate(withDuration: 0.25) {
                self.view.layoutIfNeeded()
            }
        }
    }
    
}


extension MapPickerViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        guard status == .authorizedWhenInUse else {
            return
        }
        
        locationManager.requestLocation()
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.first else {
            return
        }
        
        mapView.isHidden = false
        addressLabel.isHidden = false
        mapView.camera = GMSCameraPosition(target: location.coordinate, zoom: 15, bearing: 0, viewingAngle: 0)
        activityIndicatorView.stopAnimating()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("ERROR",error)
    }
    
}

extension MapPickerViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
      reverseGeocode(coordinate: position.target)
    }
    
}

