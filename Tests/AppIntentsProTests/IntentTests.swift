import XCTest
@testable import AppIntentsPro

final class IntentTests: XCTestCase {
    func testAddItemIntent() async throws {
        var intent = AddItemIntent()
        intent.name = "Test Item"
        intent.priority = .high
        
        let result = try await intent.perform()
        // Verify result
    }
    
    func testSearchIntent() async throws {
        var intent = SearchIntent()
        intent.query = "test"
        
        let result = try await intent.perform()
        // Verify results
    }
}
