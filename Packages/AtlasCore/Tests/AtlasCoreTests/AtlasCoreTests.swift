import AtlasCore
import Testing
@testable import AtlasCore

@Test
func testPlaceEquality() async throws {
    let p1 = Place(
        id: PlaceID(1),
        coordinate: Coordinate(latitude: 0, longitude: 0),
        name: "A",
        tags: [:]
    )

    let p2 = Place(
        id: PlaceID(1),
        coordinate: Coordinate(latitude: 0, longitude: 0),
        name: "A",
        tags: [:]
    )

    #expect(p1 == p2)
}

func testDomainErrorEquality() async throws {
    let e1 = DomainError.notFound(description: "Missing")
    let e2 = DomainError.notFound(description: "Missing")

    #expect(e1 == e2)
}
