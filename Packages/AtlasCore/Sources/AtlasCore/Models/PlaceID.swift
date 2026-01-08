//
//  PlaceID.swift
//  AtlasCore
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import Foundation

public struct PlaceID: Hashable, Sendable {
    private let id: UUID
    public init(_ id: UUID) {
        self.id = id
    }
}
