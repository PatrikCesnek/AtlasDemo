//
//  Coordinate.swift
//  AtlasCore
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import Foundation

public struct Coordinate: Hashable, Sendable {
    public let latitude: Double
    public let longitude: Double
    
    /// Initialize a coordinate with latitude and longitude.
    /// - Parameters:
    ///   - latitude: Latitude in degrees (-90...90).
    ///   - longitude: Longitude in degrees (-180...180).
    public init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
