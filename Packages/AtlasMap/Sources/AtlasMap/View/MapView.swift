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

    @State
    private var cameraPosition: MapCameraPosition = .automatic

    @Bindable
    private var viewModel: MapViewModel

    public init(viewModel: MapViewModel) {
        self._viewModel = Bindable(viewModel)
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
            await viewModel.load(lat: 52.5200, lon: 13.4050)
            updateCameraIfNeeded()
        }
    }
    
    private func updateCameraIfNeeded() {
        guard let first = viewModel.places.first else { return }

        cameraPosition = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: first.coordinate.latitude,
                    longitude: first.coordinate.longitude
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.05,
                    longitudeDelta: 0.05
                )
            )
        )
    }
}

//TODO: - Fix previews
//#Preview {
//    MapView(
//        viewModel: MapViewModel(
//            store: PlaceStore(),
//            syncEngine: PlaceSyncEngine()
//        )
//    )
//}
