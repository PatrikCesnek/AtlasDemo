//
//  PlaceStore.swift
//  AtlasStorage
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import AtlasCore

public actor PlaceStore: PlaceStoreProtocol {

    private var storage: [Place] = []

    public init() {}

    public func fetchAll() -> [Place] {
        storage
    }

    public func save(_ places: [Place]) {
        storage = places
    }

    public func append(_ places: [Place]) {
        storage.append(contentsOf: places)
    }

    public func removeAll() {
        storage.removeAll()
    }
}
