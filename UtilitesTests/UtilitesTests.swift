

import XCTest
import AppKit
import ApplicationServices
@testable import Utilites

final class UtilitesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
}

class JsonReaderTests: XCTestCase {
    
    // func should return caption app
    func testGetCaption() {
        let jsonReader = JsonReader()
        let result = jsonReader.getCaption()
        let caption = "Utilites Kit"
        
        print(result)
        
        if let captionValue = result as? String {
            XCTAssertEqual(captionValue, caption)
        } else {
            XCTFail("Caption not found in Json")
        }
    }
}
