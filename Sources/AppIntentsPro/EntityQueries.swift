import AppIntents

public struct ItemEntity: AppEntity {
    public static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Item")
    public static var defaultQuery = ItemQuery()
    
    public let id: String
    public let name: String
    
    public var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(name)")
    }
    
    public init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

public struct ItemQuery: EntityQuery {
    public init() {}
    
    public func entities(for identifiers: [String]) async throws -> [ItemEntity] {
        // Fetch entities by ID
        return []
    }
    
    public func suggestedEntities() async throws -> [ItemEntity] {
        // Return suggested entities
        return []
    }
}

public struct ItemStringQuery: EntityStringQuery {
    public init() {}
    
    public func entities(matching string: String) async throws -> [ItemEntity] {
        // Search entities
        return []
    }
}
