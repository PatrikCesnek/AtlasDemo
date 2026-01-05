//
//  NetworkingError.swift
//  AtlasNetworking
//
//  Created by Patrik Cesnek on 03/01/2026.
//

public enum NetworkingError: Error, Sendable {
    case invalidURL
    case requestFailed
    case decodingFailed
    case serverError(Int)
}
