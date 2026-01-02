//
//  AppCoordinator.swift
//  Atlas
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import AtlasMap
import AtlasStorage
import AtlasNetworking

final class AppCoordinator {
    func start() -> some View {
        let store = InMemoryPlaceStore()
        let client = OverpassClient()
        let sync = PlaceSyncEngine(
            localStore: store,
            client: client
        )

        return MapView(
            viewModel: MapViewModel(store: store)
        )
    }
}

