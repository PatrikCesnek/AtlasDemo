//
//  AtlasApp.swift
//  Atlas
//
//  Created by Patrik Cesnek on 02/01/2026.
//

import SwiftUI

@main
struct AtlasApp: App {
    private let coordinator = AppCoordinator()

    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}
