//
//  MapError.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 05/01/2026.
//

public enum MapError: Equatable, Sendable {
    case syncFailed
    case unknown

    init(_ error: Error) {
        self = .syncFailed
    }

    public var message: String {
        switch self {
        case .syncFailed: "Failed to refresh places."
        case .unknown: "Something went wrong."
        }
    }
}
