//
//  OverpassQuery.swift
//  AtlasNetworking
//
//  Created by Patrik Cesnek on 02/01/2026.
//

public enum OverpassQuery: Sendable {
    case cafes(lat: Double, lon: Double)

    public var body: String {
        switch self {
        case let .cafes(lat, lon):
            return """
            [out:json];
            node
              ["amenity"="cafe"]
              (around:1000,\(lat),\(lon));
            out;
            """
        }
    }
}
