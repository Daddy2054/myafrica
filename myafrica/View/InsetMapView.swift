//
//  InsetMapView.swift
//  myafrica
//
//  Created by Jean on 29/04/25.
//

import MapKit
import SwiftUI

struct InsetMapView: View {
    // MARK: - PROPERTIES
    @State private var cameraPosition = MapCameraPosition.region( MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 6.600286,
            longitude: 16.4377599
        ),
        span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0)
    ))
    //    let animal: Animal
    //MARK: - BODY
    var body: some View {
        Map(position: $cameraPosition)
            .overlay(
                NavigationLink(destination: MapView()) {
                    HStack {
                        Image(systemName: "mappin.circle")
                            .foregroundStyle(Color.white)
                            .imageScale(.large)
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                    }  //:HSTACK
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(
                        Color.black.opacity(0.4)
                            .cornerRadius(8)
                    )
                }  //: NAVIGATION
                .padding(12),
                alignment: .topTrailing
            )

            .frame(height: 256)
            .cornerRadius(12)
    }
}

//MARK: - PREVIEW
struct InsetMapView_Previews: PreviewProvider {

    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
