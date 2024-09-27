//
//  LocationManager.swift
//  TruckX iOS Application
//
//  Created by Owais on 20/08/24.
//

import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    private let geocoder = CLGeocoder()
    
    // Location update closure
    var didUpdateLocation: ((String) -> Void)?
    
    private override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        let status = CLLocationManager.authorizationStatus()
        switch status {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .restricted, .denied:
            print("Location services are restricted or denied.")
        @unknown default:
            fatalError("Unknown authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        reverseGeocode(location: location)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user's location: \(error.localizedDescription)")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        requestLocation()
    }
    
    private func reverseGeocode(location: CLLocation) {
        geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
            if let error = error as? CLError {
                switch error.code {
                case .network:
                    print("Geocoding error: Network issue. Please check your connection.")
                case .geocodeFoundNoResult:
                    print("Geocoding error: No result found for the given location.")
                case .geocodeCanceled:
                    print("Geocoding error: Geocode request was canceled.")
                case .geocodeFoundPartialResult:
                    print("Geocoding warning: Partial result found.")
                default:
                    print("Geocoding error: \(error.localizedDescription)")
                }
                return
            }
            
            guard let placemark = placemarks?.first else {
                print("No placemarks found.")
                return
            }
            
            let country = placemark.country ?? "Unknown country"
            let city = placemark.locality ?? "Unknown city"
            let area = placemark.subLocality ?? "Unknown area"
            //            let locationString = "Country: \(country), City: \(city), Area: \(area)"
            let locationString2 = "\(area), \(city), \(country)"
            
            self?.didUpdateLocation?(locationString2)
        }
    }
}
