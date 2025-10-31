import AppIntents

public struct WorkFocusFilter: SetFocusFilterIntent {
    public static var title: LocalizedStringResource = "Work Mode"
    
    @Parameter(title: "Enable Work Mode")
    public var enabled: Bool
    
    public init() {}
    
    public func perform() async throws -> some IntentResult {
        // Apply focus filter
        return .result()
    }
}

public struct CustomFocusFilter: AppIntent {
    public static var title: LocalizedStringResource = "Custom Focus"
    
    @Parameter(title: "Filter Name")
    public var filterName: String
    
    public init() {}
    
    public func perform() async throws -> some IntentResult {
        // Apply custom filter
        return .result()
    }
}
