//
//  MapCoordinator.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import Foundation
import SwiftUI
import AtlasCore
import AtlasStorage
import AtlasSync

@MainActor
public final class MapCoordinator {

    private let store: PlaceStore
    private let syncEngine: PlaceSyncEngineProtocol

    /// Initialize the MapCoordinator with storage and sync engine.
    /// - Parameters:
    ///   - store: Actor-based storage for places.
    ///   - syncEngine: Engine responsible for syncing remote data.
    public init(
        store: PlaceStore,
        syncEngine: PlaceSyncEngineProtocol
    ) {
        self.store = store
        self.syncEngine = syncEngine
    }

    public func start() -> some View {
        let viewModel = MapViewModel(store: store, syncEngine: syncEngine)
        return NavigationStack {
            MapView(viewModel: viewModel)
        }
    }
}
