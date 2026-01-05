//
//  PlaceID.swift
//  AtlasCore
//
//  Created by Patrik Cesnek on 02/01/2026.
//

public struct PlaceID: Hashable, Sendable {
    private let rawValue: Int64
    public init(_ rawValue: Int64) {
        self.rawValue = rawValue
    }
}
