//
//  MapState.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 05/01/2026.
//

import AtlasCore
import Foundation

public enum MapState: Equatable, Sendable {
    case idle
    case loading
    case loaded([Place])
    case failed(MapError)
}
