# Brick Time
The application using a **modern, test-driven (TDD) approach**, designed to demonstrate clean architecture, testability and clarity.

# Technical choices and architecture
- MVVM architecture
- @MainActor onViewModel to guarantee UI-thread safety
- Protocol-based dependencies
- Dependency injection

# Testing
In this project I chose to use Swift Testing (`import Testing`) and focuses on behavior and not implementation details.

# What's tested:
- Domain logic `BrickTimeTransformer`
- ViewModel initial state
- ViewModel updated based on a mocked clock
- Formatted digital output


# How to Run the App
**You need:**
- Xcode 16 or later
- Min iOS 18.5+ simulator or device

**Steps:**
1. Clone the project
2. Open `BrickTime.xcodeproj`
3. Select a simulator
4. Run the project

The clock and digital time will update every second.

# How to Run Tests
1. All test are located in `BrickTimeTransformerTests` & `BrickTimeViewModelTests`
2. Press ⌘U

# Possible improvements
- Swift package separation for the main logic
- UI animation and improvments
- UI snapshot testing
- 12h/24h format time toggle
