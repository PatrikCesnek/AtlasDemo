//
//  Place+extension.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 06/01/2026.
//

import AtlasCore
import CoreLocation

extension Place {
    static let preview: [Place] = [
        Place(
            id: PlaceID(UUID()),
            coordinate: .init(latitude: 52.52, longitude: 13.405),
            name: "Cafe Atlas"
        ),
        Place(
            id: PlaceID(UUID()),
            coordinate: .init(latitude: 52.521, longitude: 13.41),
            name: "Coffee Berlin",
        )
    ]
}
