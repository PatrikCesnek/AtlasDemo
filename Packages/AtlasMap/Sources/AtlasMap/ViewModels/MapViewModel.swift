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

    public private(set) var state: MapState = .idle

    private let store: PlaceStoreProtocol
    private let syncEngine: PlaceSyncEngineProtocol

    public init(
        store: PlaceStoreProtocol,
        syncEngine: PlaceSyncEngineProtocol
    ) {
        self.store = store
        self.syncEngine = syncEngine
    }

    public func load(lat: Double, lon: Double) async {
        state = .loading

        let cached = await store.fetchAll()
        if !cached.isEmpty {
            state = .loaded(cached)
        }

        do {
            try await syncEngine.refresh(lat: lat, lon: lon)
            let fresh = await store.fetchAll()
            state = .loaded(fresh)
        } catch {
            state = .failed(MapError(error))
        }
    }
}
