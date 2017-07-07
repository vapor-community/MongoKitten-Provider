import Vapor
import XCTest
@testable import MongoKittenProvider

class MongoKittenProviderTests: XCTestCase {
    func testExample() throws {
        var config = try Config()
        try config.set("mongo.url", "mongodb://localhost/example-database")
        try config.addProvider(MongoKittenProvider.Provider.self)
        
        let drop = try Droplet(config)
        
        let db = try drop.assertMongoDB()
        
        XCTAssertEqual(db.name, "example-database")
    }
    
    static var allTests: [(String, (MongoKittenProviderTests) -> () throws -> Void)] = [
        ("testExample", testExample),
    ]
}

