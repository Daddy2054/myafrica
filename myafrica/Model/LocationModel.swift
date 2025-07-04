//
//  LocationModel.swift
//  myafrica
//
//  Created by Jean on 01/05/25.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
  var id: String
  var name: String
  var image: String
  var latitude: Double
  var longitude: Double
  
  // Computed Property
  var location: CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
  }
}
