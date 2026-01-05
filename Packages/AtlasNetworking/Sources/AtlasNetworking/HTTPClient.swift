//
//  HTTPClient.swift
//  AtlasNetworking
//
//  Created by Patrik Cesnek on 03/01/2026.
//

import Foundation

public struct HTTPClient: Sendable {

    private let session: URLSession

    public init(session: URLSession = .shared) {
        self.session = session
    }

    public func get(url: URL) async throws -> Data {
        let (data, response) = try await session.data(from: url)

        guard let http = response as? HTTPURLResponse else {
            throw NetworkingError.requestFailed
        }

        guard (200..<300).contains(http.statusCode) else {
            throw NetworkingError.serverError(http.statusCode)
        }

        return data
    }
}
