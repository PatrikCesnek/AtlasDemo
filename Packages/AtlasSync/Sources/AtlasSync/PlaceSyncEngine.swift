//
//  PlaceSyncEngine.swift
//  AtlasSync
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import AtlasCore
import AtlasStorage
import AtlasNetworking

public actor PlaceSyncEngine: PlaceSyncEngineProtocol {

    private let localStore: PlaceStore
    private let client: OverpassClient
    private let policy: SyncPolicy

    public init(
        localStore: PlaceStore,
        client: OverpassClient,
        policy: SyncPolicy = .replace
    ) {
        self.localStore = localStore
        self.client = client
        self.policy = policy
    }

    public func refresh(lat: Double, lon: Double) async throws {
        do {
            let response = try await client.execute(.cafes(lat: lat, lon: lon))
            let places = response.toPlaces()

            switch policy {
            case .replace:
                await localStore.save(places)

            case .merge:
                let existing = await localStore.fetchAll()
                let merged = merge(existing: existing, incoming: places)
                await localStore.save(merged)
            }
        } catch {
            throw SyncError.failedToSync(underlying: error)
        }
    }

    private func merge(
        existing: [Place],
        incoming: [Place]
    ) -> [Place] {
        let map = Dictionary(
            uniqueKeysWithValues: existing.map { ($0.id, $0) }
        )

        return incoming.map { map[$0.id] ?? $0 }
    }
}
