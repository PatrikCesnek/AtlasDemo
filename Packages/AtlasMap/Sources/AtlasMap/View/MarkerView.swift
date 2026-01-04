//
//  MarkerView.swift
//  AtlasMap
//
//  Created by Patrik Cesnek on 03/01/2026.
//

import AtlasCore
import SwiftUI

struct MarkerView: View {
    private let place: Place

    init(place: Place) {
        self.place = place
    }

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 16, height: 16)
                .foregroundStyle(.red)

            if let name = place.name {
                Text(name)
                    .font(.caption)
                    .padding(4)
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
        }
    }
}

#Preview {
    MarkerView(
        place: Place(
            id: PlaceID(0),
            coordinate: Coordinate.init(latitude: 52.5200, longitude: 13.4050)
        )
    )
}
