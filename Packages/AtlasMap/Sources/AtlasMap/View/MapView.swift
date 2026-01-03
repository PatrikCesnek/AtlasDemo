//
//  MapView.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import SwiftUI
import MapKit
import AtlasCore

public struct MapView: View {

    @State private var cameraPosition: MapCameraPosition = .automatic
    @Bindable private var viewModel: MapViewModel

    public init(viewModel: MapViewModel) {
        self.viewModel = viewModel
    }

    public var body: some View {
        Map(position: $cameraPosition) {
            ForEach(viewModel.places) { place in
                Annotation(
                    place.name ?? "Unknown",
                    coordinate: CLLocationCoordinate2D(
                        latitude: place.coordinate.latitude,
                        longitude: place.coordinate.longitude
                    )
                ) {
                    MarkerView(place: place)
                }
            }
        }
        .task {
            //TODO: - Use User's location
            await viewModel.load(lat: 52.5200, lon: 13.4050)
        }
    }
}
