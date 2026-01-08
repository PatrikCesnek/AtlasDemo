//
//  PreviewPlaceStore.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 06/01/2026.
//

import AtlasCore
import AtlasStorage

public final class PreviewPlaceStore: PlaceStoreProtocol {

    private let places: [Place]

    public init(places: [Place]) {
        self.places = places
    }

    public func fetchAll() async -> [Place] {
        places
    }

    public func save(_ places: [Place]) async {}
}
