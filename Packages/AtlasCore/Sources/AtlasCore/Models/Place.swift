//
//  Place.swift
//  AtlasCore
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import Foundation

public struct Place: Identifiable, Equatable, Sendable {
    public let id: PlaceID
    public let coordinate: Coordinate
    public let name: String?
    public let tags: [String: String]

    /// Initilize a place with:
    /// - Parameters:
    /// - id: ID of the place using raw value of Int64.
    /// - coordinate: Coordinate with latitude and longitude.
    /// - name: optional name of the place, nil by default.
    /// - tags: dictionary of String : String
    public init(
        id: PlaceID,
        coordinate: Coordinate,
        name: String? = nil,
        tags: [String: String] = [:]
    ) {
        self.id = id
        self.coordinate = coordinate
        self.name = name
        self.tags = tags
    }
}
