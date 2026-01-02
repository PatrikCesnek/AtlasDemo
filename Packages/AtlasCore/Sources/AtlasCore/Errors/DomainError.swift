//
//  DomainError.swift
//  AtlasCore
//
//  Created by Patrik Cesnek on 02/01/2026.
//

public enum DomainError: Error, Equatable, Sendable {
    case unknown
    case notFound(description: String)
    case invalidOperation(description: String)
    case validationFailed(field: String, description: String)
}
