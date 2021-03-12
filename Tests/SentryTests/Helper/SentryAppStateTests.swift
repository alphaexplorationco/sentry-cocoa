import XCTest

class SentryAppStateTests: XCTestCase {

    func testSerialize() {
        let appState = TestData.appState
        
        let actual = appState.serialize()
        
        XCTAssertEqual(appState.appVersion, actual["app_version"] as? String)
        XCTAssertEqual(appState.osVersion, actual["os_version"] as? String)
    }
    
    func testInitWithJSON_AllFields() {
        let appState = TestData.appState
        let dict = ["app_version": appState.appVersion, "os_version": appState.osVersion]
        
        let actual = SentryAppState(jsonObject: dict)
        
        XCTAssertEqual(appState.appVersion, actual?.appVersion)
        XCTAssertEqual(appState.osVersion, actual?.osVersion)
    }
    
    func testInitWithJSON_IfJsonMissesField_AppStateIsNil() {
        withValue { $0["app_version"] = nil }
        withValue { $0["os_version"] = nil }
    }
    
    func testInitWithJSON_IfJsonContainsWrongFields_AppStateIsNil() {
        withValue { $0["app_version"] = 0 }
        withValue { $0["os_version"] = 0 }
    }
    
    func withValue(setValue: (inout [String: Any]) -> Void) {
        let expected = TestData.appState
        var serialized = expected.serialize()
        setValue(&serialized)
        XCTAssertNil(SentryAppState(jsonObject: serialized))
    }

}
