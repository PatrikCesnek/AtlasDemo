//
//  OverpassResponse.swift
//  AtlasNetworking
//
//  Created by Patrik Cesnek on 03/01/2026.
//

import AtlasCore

public struct OverpassResponse: Decodable, Sendable {

    public let elements: [Element]

    public struct Element: Decodable, Sendable {
        public let id: Int64
        public let lat: Double
        public let lon: Double
        public let tags: [String: String]?
    }

    public func toPlaces() -> [Place] {
        elements.map {
            Place(
                id: PlaceID($0.id),
                coordinate: Coordinate(
                    latitude: $0.lat,
                    longitude: $0.lon
                ),
                name: $0.tags?["name"],
                tags: $0.tags ?? [:]
            )
        }
    }
}
