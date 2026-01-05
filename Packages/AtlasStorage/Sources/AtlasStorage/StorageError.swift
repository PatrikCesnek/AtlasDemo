//
//  StorageError.swift
//  AtlasStorage
//
//  Created by Patrik Cesnek on 03/01/2026.
//

public enum StorageError: Error, Equatable, Sendable {
    case notFound
    case corruptedData
    case unsupportedOperation
}
