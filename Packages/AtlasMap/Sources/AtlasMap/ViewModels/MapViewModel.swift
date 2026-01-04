//
//  MapViewModel.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import AtlasCore
import AtlasStorage
import AtlasSync
import Foundation

@MainActor
@Observable
public final class MapViewModel {

    public private(set) var places: [Place] = []
    public private(set) var isLoading = false
    public private(set) var state: MapState = .idle

    private let store: PlaceStore
    private let syncEngine: PlaceSyncEngine

    public init(
        store: PlaceStore,
        syncEngine: PlaceSyncEngine
    ) {
        self.store = store
        self.syncEngine = syncEngine
    }

    public func load(lat: Double, lon: Double) async {
        isLoading = true
        defer { isLoading = false }

        places = await store.fetchAll()

        do {
            try await syncEngine.refresh(lat: lat, lon: lon)

            places = await store.fetchAll()
        } catch {
            //TODO: - add error handling
            print("Map sync failed: \(error)")
        }
    }
}

public enum MapState: Sendable {
    case idle
    case loading
    case loaded([Place])
    case failed
}

