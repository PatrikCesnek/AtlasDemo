import Testing
import AtlasSync
import AtlasStorage
import Foundation
@testable import AtlasMap

@Test
@MainActor
func loadFailureSetsFailedState() async {
    let store = PlaceStore()
    let sync = FailingSyncEngine()
    let vm = MapViewModel(store: store, syncEngine: sync)

    await vm.load(lat: 0, lon: 0)

    #expect(vm.state == .failed(.syncFailed))
}

actor FailingSyncEngine: PlaceSyncEngineProtocol {

    func refresh(lat: Double, lon: Double) async throws {
        throw SyncError.failedToSync(underlying: NSError(domain: "test", code: 1))
    }
}
