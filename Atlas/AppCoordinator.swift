//
//  AppCoordinator.swift
//  Atlas
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import AtlasCore
import AtlasMap
import AtlasNetworking
import AtlasStorage
import AtlasSync
import SwiftUI

final class AppCoordinator {
    @MainActor
    func start() -> some View {
        let store = PlaceStore()
        let client = OverpassClient()

        let sync: any AtlasSync.PlaceSyncEngineProtocol =
            PlaceSyncEngine(localStore: store, client: client)

        let viewModel = MapViewModel(store: store, syncEngine: sync)


        return NavigationStack {
            MapView(viewModel: viewModel)
        }
    }
}

public protocol Coordinator {
    associatedtype Content: View
    @MainActor
    func start() -> Content
}
