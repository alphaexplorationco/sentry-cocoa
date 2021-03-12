import XCTest

class SentryOutOfMemoryTrackerTests: XCTestCase {
    
    private static let dsnAsString = TestConstants.dsnAsString(username: "SentryOutOfMemoryTrackerTests")
    private static let dsn = TestConstants.dsn(username: "SentryOutOfMemoryTrackerTests")
    
    private class Fixture {
        
        let options: Options
        let client: TestClient!
        let sentryCrash: TestSentryCrashWrapper
        let fileManager: SentryFileManager
        
        init() {
            options = Options()
            options.dsn = SentryOutOfMemoryTrackerTests.dsnAsString
            options.releaseName = "1.0.0"
            
            client = TestClient(options: options)
            
            sentryCrash = TestSentryCrashWrapper()
            
            let hub = SentryHub(client: client, andScope: nil, andCrashAdapter: self.sentryCrash)
            SentrySDK.setCurrentHub(hub)
            
            fileManager = try! SentryFileManager(dsn: SentryOutOfMemoryTrackerTests.dsn, andCurrentDateProvider: TestCurrentDateProvider())
        }
        
        func getSut() -> SentryOutOfMemoryTracker {
            return SentryOutOfMemoryTracker(options: options)
        }
    }
    
    private var fixture: Fixture!
    
    override func setUp() {
        super.setUp()
        
        fixture = Fixture()
    }

    func testDifferentAppVersions_NoOOM() throws {
        
        let sut = fixture.getSut()
        
        sut.start()
        
        XCTAssertEqual(0, fixture.client.captureMessageWithScopeArguments.count)
    }

}
