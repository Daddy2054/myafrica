//
//  MapView.swift
//  myafrica
//
//  Created by Jean on 20/12/24.
//

import MapKit
import SwiftUI

struct MapView: View {
    // MARK: - PROPERTIES
    @State private var cameraPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: 6.600286,
                longitude: 16.4377599
            ),
            span: MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        )
    )

    @State private var currentCenter = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
    @State private var currentSpan = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)

    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    //    private var cameraCenter: CLLocationCoordinate2D {
    //        switch cameraPosition {
    //        case .region( let region ):
    //            return region.center
    //        default:
    //            return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    //        }
    //    }
    // MARK: - BODY
    var body: some View {
        Map(position: $cameraPosition) {
            ForEach(locations) { item in
                Annotation(item.name, coordinate: item.location) {
                    MapAnnotationView(location: item)
                }
            }
        }
        .onMapCameraChange { context in
            let center = context.camera.centerCoordinate
            let span = context.region.span
            cameraPosition = .region(MKCoordinateRegion(center: center, span: span))
            currentCenter = center
            currentSpan = span
        }
         .overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)

                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
//                        Text("\(cameraPosition.region?.center.latitude ?? 0)")
                        Text("\(currentCenter.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                    Divider()

                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
//                        Text("\(cameraPosition.region?.center.longitude ?? 0)")
                        Text("\(currentCenter.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding(),
            alignment: .top
        )
    }

    //     Extract coordinate from current camera position (fallback if it's not region-based)
    //         private var cameraCoordinate: CLLocationCoordinate2D {
    //             switch cameraPosition {
    //             case MapCameraPosition.region:
    //                 return MapCameraPosition.region.center
    //             default:
    //                 return CLLocationCoordinate2D(latitude: 0, longitude: 0)
    //             }
    //         }
}

// MARK: - PREVIEW
#Preview {
    MapView()
}
