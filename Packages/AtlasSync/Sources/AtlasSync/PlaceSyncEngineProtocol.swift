//
//  PlaceSyncEngineProtocol.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 05/01/2026.
//

public protocol PlaceSyncEngineProtocol: Sendable {
    func refresh(lat: Double, lon: Double) async throws
}
