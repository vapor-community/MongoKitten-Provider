import Vapor
@_exported import MongoKitten
@_exported import BSON

public final class Provider: Vapor.Provider {
    public static let repositoryName: String = "mongokitten-provider"
    
    public let database: Database
    
    public init(config: Config) throws {
        self.database = try Database(config: config)
    }
    
    /// Called after the provider has initialized
    /// in the `Config.addProvider` call.
    public func boot(_ config: Config) throws {}
    
    /// Called after the Droplet has initialized.
    public func boot(_ droplet: Droplet) throws {
        droplet.database = self.database
    }
    
    /// Called before the Droplet begins serving
    /// which is @noreturn.
    public func beforeRun(_ droplet: Droplet) throws { }
}


extension Database: ConfigInitializable {
    public convenience init(config: Config) throws {
        guard let mongo = config["mongo"] else {
            throw ConfigError.missingFile("mongo")
        }
        
        guard let url = mongo["url"]?.string else {
            throw ConfigError.missing(
                key: ["url"],
                file: "mongo",
                desiredType: String.self
            )
        }
        
        let maxConnectionsPerServer = mongo["maxConnectionsPerServer"]?.int ?? 100
        
        try self.init(url, maxConnectionsPerServer: maxConnectionsPerServer)
    }
}

extension Droplet {
    public internal(set) var database: Database? {
        get {
            return self.storage["mongokitten-provider-database"] as? Database
        }
        set {
            self.storage["mongokitten-provider-database"] = newValue
        }
    }
    
    public func assertDatabase() throws -> Database {
        guard let database = self.database else {
            throw MongoError.notConnected
        }
        
        return database
    }
}
