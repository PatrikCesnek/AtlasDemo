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
        content
            .task {
                await viewModel.load(lat: 52.5200, lon: 13.4050)
            }
            .onChange(of: viewModel.state) { _, newState in
                updateCameraIfNeeded(for: newState)
            }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {

        case .idle, .loading:
            ProgressView("Loading places…")

        case .loaded(let places):
            mapView(places)

        case .failed(let error):
            ContentUnavailableView(
                "Error",
                systemImage: "exclamationmark.triangle",
                description: Text(error.message)
            )
        }
    }

    private func mapView(_ places: [Place]) -> some View {
        Map(position: $cameraPosition) {
            ForEach(places) { place in
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
    }

    private func updateCameraIfNeeded(for state: MapState) {
        guard case .loaded(let places) = state,
              let first = places.first
        else { return }

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
