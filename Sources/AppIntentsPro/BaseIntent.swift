import AppIntents

/// Base intent with common functionality
open class BaseIntent: AppIntent {
    public init() {}
    
    public func log(_ message: String) {
        print("[Intent] \(Self.title): \(message)")
    }
    
    public func handleError(_ error: Error) -> IntentError {
        log("Error: \(error.localizedDescription)")
        return IntentError.general
    }
}

public enum IntentError: Error {
    case general
    case invalidInput
    case notFound
}
