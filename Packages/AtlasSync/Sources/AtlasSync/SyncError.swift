//
//  SyncError.swift
//  AtlasSync
//
//  Created by Patrik Cesnek on 03/01/2026.
//

import Foundation

public enum SyncError: Error, Sendable {
    case failedToSync(underlying: Error)
}
