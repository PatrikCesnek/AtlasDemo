//
//  PlaceStoreProtocol.swift
//  AtlasStorage
//
//  Created by Patrik Cesnek on 08/01/2026.
//

import AtlasCore

public protocol PlaceStoreProtocol: Sendable {
    func fetchAll() async -> [Place]
    func save(_ places: [Place]) async
}
