import AppIntents

public struct AddItemIntent: AppIntent {
    public static var title: LocalizedStringResource = "Add Item"
    public static var description = IntentDescription("Quickly add a new item")
    
    @Parameter(title: "Item Name")
    public var name: String
    
    @Parameter(title: "Priority", default: .medium)
    public var priority: Priority
    
    public init() {}
    
    public func perform() async throws -> some IntentResult & ProvidesDialog {
        // Add item logic
        return .result(dialog: "Added \(name) with \(priority.rawValue) priority")
    }
    
    public enum Priority: String, AppEnum {
        case low, medium, high
        
        public static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Priority")
        public static var caseDisplayRepresentations: [Priority: DisplayRepresentation] = [
            .low: "Low",
            .medium: "Medium",
            .high: "High"
        ]
    }
}

public struct SearchIntent: AppIntent {
    public static var title: LocalizedStringResource = "Search"
    public static var description = IntentDescription("Search for items")
    
    @Parameter(title: "Query")
    public var query: String
    
    public init() {}
    
    public func perform() async throws -> some IntentResult & ReturnsValue<[SearchResult]> {
        let results = await performSearch(query: query)
        return .result(value: results)
    }
    
    private func performSearch(query: String) async -> [SearchResult] {
        // Search logic
        return []
    }
}

public struct SearchResult: Identifiable {
    public let id: String
    public let title: String
}
