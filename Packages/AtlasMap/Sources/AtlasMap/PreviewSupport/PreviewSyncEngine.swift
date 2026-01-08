//
//  PreviewSyncEngine.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 06/01/2026.
//

import AtlasSync

public struct PreviewSyncEngine: PlaceSyncEngineProtocol {
    public init() {}
    public func refresh(lat: Double, lon: Double) async throws {}
}
