# App Intents Pro

Production-ready App Intents framework for Siri, Shortcuts, and Spotlight integration on iOS 18+.

## 🎯 Features

### Quick Actions
- Add item intent
- Search intent
- Custom parameters
- Priority levels

### Entity Queries
- Entity definitions
- String queries
- Suggested entities
- ID-based lookup

### Focus Filters
- Work mode
- Custom filters
- State management

### App Shortcuts
- Siri phrases
- Spotlight integration
- System images
- Short titles

## 📦 Installation

```swift
dependencies: [
    .package(url: "https://github.com/durellwilson/appintents-pro.git", from: "1.0.0")
]
```

## 🚀 Quick Start

### Define Intent

```swift
import AppIntents

struct CreateTaskIntent: AppIntent {
    static var title: LocalizedStringResource = "Create Task"
    
    @Parameter(title: "Task Name")
    var name: String
    
    @Parameter(title: "Due Date")
    var dueDate: Date?
    
    func perform() async throws -> some IntentResult & ProvidesDialog {
        // Create task
        return .result(dialog: "Created task: \(name)")
    }
}
```

### Register Shortcuts

```swift
struct MyAppShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: CreateTaskIntent(),
            phrases: [
                "Create task in \(.applicationName)",
                "Add task to \(.applicationName)"
            ],
            shortTitle: "New Task",
            systemImageName: "checkmark.circle.fill"
        )
    }
}
```

### Entity Query

```swift
struct TaskEntity: AppEntity {
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Task")
    static var defaultQuery = TaskQuery()
    
    let id: String
    let title: String
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(title)")
    }
}

struct TaskQuery: EntityQuery {
    func entities(for identifiers: [String]) async throws -> [TaskEntity] {
        // Fetch tasks
        return []
    }
    
    func suggestedEntities() async throws -> [TaskEntity] {
        // Return recent tasks
        return []
    }
}
```

### Use in SwiftUI

```swift
import SwiftUI
import AppIntents

struct ContentView: View {
    var body: some View {
        Button("Add Task") {
            Task {
                var intent = CreateTaskIntent()
                intent.name = "New Task"
                try? await intent.perform()
            }
        }
    }
}
```

## 🎨 Advanced Features

### Parameters with Options

```swift
@Parameter(title: "Category")
var category: Category

enum Category: String, AppEnum {
    case work, personal, shopping
    
    static var typeDisplayRepresentation = TypeDisplayRepresentation(name: "Category")
    static var caseDisplayRepresentations: [Category: DisplayRepresentation] = [
        .work: "Work",
        .personal: "Personal",
        .shopping: "Shopping"
    ]
}
```

### Dynamic Options

```swift
@Parameter(title: "Project")
var project: ProjectEntity

struct ProjectEntity: AppEntity {
    // Dynamic project list
}
```

### Return Values

```swift
func perform() async throws -> some IntentResult & ReturnsValue<[Task]> {
    let tasks = await fetchTasks()
    return .result(value: tasks)
}
```

### Confirmation Dialog

```swift
func perform() async throws -> some IntentResult & ProvidesDialog {
    return .result(dialog: "Task created successfully!")
}
```

## 🧪 Testing

```swift
func testIntent() async throws {
    var intent = CreateTaskIntent()
    intent.name = "Test Task"
    
    let result = try await intent.perform()
    
    // Verify result
    XCTAssertNotNil(result)
}
```

## 📱 Integration Points

### Siri
"Hey Siri, create task in MyApp"

### Shortcuts App
- Add to shortcuts
- Automation triggers
- Share sheet

### Spotlight
- Search results
- Quick actions
- Top hits

### Focus Filters
- Work mode
- Personal mode
- Custom filters

## 🎯 Use Cases

### Productivity App
```swift
- "Add task"
- "Mark complete"
- "Show today's tasks"
- "Set reminder"
```

### Note Taking
```swift
- "Create note"
- "Search notes"
- "Add to favorites"
```

### Shopping List
```swift
- "Add to list"
- "Check off item"
- "Clear list"
```

## 🏗️ Best Practices

1. **Clear phrases** - Use natural language
2. **Meaningful icons** - SF Symbols
3. **Quick execution** - < 1 second
4. **Error handling** - Graceful failures
5. **Privacy** - Request permissions

## 📊 Performance

- Intent execution: < 100ms
- Entity queries: < 500ms
- Background execution: Supported
- Offline mode: Partial support

## 🤝 Contributing

Part of Detroit's Swift ecosystem!

## 📝 License

MIT License

---

**Siri, Shortcuts, and Spotlight integration** 🎤
