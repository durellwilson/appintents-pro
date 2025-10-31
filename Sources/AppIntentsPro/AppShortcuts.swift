import AppIntents

public struct MyAppShortcuts: AppShortcutsProvider {
    public static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: AddItemIntent(),
            phrases: [
                "Add item in \(.applicationName)",
                "Create new item in \(.applicationName)"
            ],
            shortTitle: "Add Item",
            systemImageName: "plus.circle.fill"
        )
        
        AppShortcut(
            intent: SearchIntent(),
            phrases: [
                "Search \(.applicationName)",
                "Find in \(.applicationName)"
            ],
            shortTitle: "Search",
            systemImageName: "magnifyingglass"
        )
    }
}
