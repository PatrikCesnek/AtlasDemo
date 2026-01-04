//
//  OverpassClient.swift
//  AtlasNetworking
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import Foundation

public struct OverpassClient: Sendable {

    private let http: HTTPClient
    private let baseURL = "https://overpass-api.de/api/interpreter"

    public init(http: HTTPClient = .init()) {
        self.http = http
    }

    public func execute(_ query: OverpassQuery) async throws -> OverpassResponse {
        guard var components = URLComponents(string: baseURL) else {
            throw NetworkingError.invalidURL
        }

        components.queryItems = [
            URLQueryItem(name: "data", value: query.body)
        ]

        guard let url = components.url else {
            throw NetworkingError.invalidURL
        }

        let data = try await http.get(url: url)

        do {
            return try JSONDecoder().decode(OverpassResponse.self, from: data)
        } catch {
            throw NetworkingError.decodingFailed
        }
    }
}
