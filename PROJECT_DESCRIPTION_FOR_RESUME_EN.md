# Habbits - iOS Habit Tracking Application

## Project Overview
**Development Period**: May 2025 - Present  
**Development Environment**: iOS 15.0+, Xcode 14.0+, Swift 5.7+  
**Architecture**: MVVM (Model-View-ViewModel)  
**UI Framework**: SwiftUI  
**Data Storage**: UserDefaults + Codable  
**Notification System**: UserNotifications  

## Project Description
A native iOS application designed for personal habit formation and tracking, enabling users to check daily habits and monitor consecutive achievement streaks. The app provides an intuitive UI/UX with robust data management capabilities to help users achieve their goals.

## Core Features & Technical Achievements

### 1. Habit Management System
- **Customization**: Personalized habit expression through emojis and colors
- **Data Modeling**: Efficient data serialization/deserialization using Codable protocol
- **Local Storage**: Secure data persistence management through UserDefaults

### 2. Time-Based Logic Implementation
- **4PM Boundary System**: User experience-focused daily boundary setting (4 PM standard)
- **Calendar Extension**: Encapsulation of complex date calculation logic through Calendar extension
- **Auto Count Update**: Automatic day calculation based on time progression

### 3. Notification System
- **UNUserNotificationCenter**: Utilization of iOS native notification system
- **Permission Management**: User notification permission request and handling
- **Delegate Pattern**: Notification handling based on app lifecycle

### 4. SwiftUI-Based UI/UX
- **Responsive Design**: Support for various screen sizes
- **Dark Mode Support**: Automatic color switching based on system theme
- **Sheet Presentation**: Modal-style form interface
- **Custom Components**: Reusable UI component design

### 5. MVVM Architecture
- **ViewModel**: Separation of business logic and UI state management
- **ObservableObject**: Reactive data binding with SwiftUI
- **EnvironmentObject**: App-wide state management

## Technical Challenges & Solutions

### 1. Complex Date Calculation Logic
**Challenge**: User experience-focused daily boundary setting  
**Solution**: Implementation of 4PM-based boundary system through Calendar Extension
```swift
func last4PMBoundary(for date: Date) -> Date {
    // Encapsulation of complex date calculation logic
}
```

### 2. Data Consistency Assurance
**Challenge**: Data synchronization upon app restart  
**Solution**: Stable data storage using Codable protocol and UserDefaults

### 3. Real-time UI Updates
**Challenge**: Automatic UI reflection upon data changes  
**Solution**: Reactive architecture using @StateObject and @EnvironmentObject

## Development Achievements & Learning Outcomes

### Technical Achievements
- **Native iOS Development**: Modern iOS app development experience using SwiftUI
- **Architecture Design**: Scalable code structure through MVVM pattern
- **User Experience**: Intuitive UI/UX design and implementation
- **Data Management**: Efficient local data storage and management

### Problem-Solving Skills
- Implementation of complex business logic into simple, understandable code
- Transformation of user requirements into technical solutions
- Design considering code reusability and maintainability

### Collaboration & Project Management
- Version control and code review through Git
- Systematic project structure design
- Documentation and README writing

## Technology Stack
- **Language**: Swift 5.7+
- **UI**: SwiftUI, UIKit (Notifications)
- **Architecture**: MVVM
- **Data**: UserDefaults, Codable
- **Notifications**: UserNotifications
- **Dependency Management**: CocoaPods
- **Version Control**: Git, GitHub

## Project Results
- Completed fully functional iOS application
- Implemented user-friendly interface
- Built stable data management system
- Designed scalable architecture

---

## Resume Version (Concise)

**Habbits - iOS Habit Tracking App**  
*Swift, SwiftUI, MVVM Architecture*

- Developed native iOS application using SwiftUI for user habit tracking functionality
- Applied MVVM architectural pattern to design scalable and maintainable code structure
- Implemented push notification system using UserNotifications and local data management with UserDefaults
- Encapsulated complex date calculation logic through Calendar Extension to improve code reusability
- Enhanced user experience with dark mode support and responsive UI design

**Tech Stack**: Swift, SwiftUI, UserNotifications, UserDefaults, MVVM, Git

---

## Interview Talking Points

### Technical Implementation
- **MVVM Architecture**: Explain how you separated concerns between Model, View, and ViewModel
- **SwiftUI Integration**: Discuss reactive programming with @StateObject and @EnvironmentObject
- **Data Persistence**: Describe UserDefaults implementation and Codable protocol usage
- **Notification System**: Explain UNUserNotificationCenter integration and permission handling

### Problem-Solving Examples
- **Date Boundary Logic**: How you solved the 4PM boundary problem for better UX
- **State Management**: How you handled app-wide state with EnvironmentObject
- **UI Responsiveness**: How you ensured smooth UI updates with reactive architecture

### Code Quality & Best Practices
- **Clean Code**: How you wrote maintainable and readable Swift code
- **Error Handling**: How you handled edge cases and user input validation
- **Testing**: Any unit tests or UI tests you implemented (if applicable)

### User Experience Focus
- **Intuitive Design**: How you designed the UI to be user-friendly
- **Accessibility**: Any accessibility features you considered
- **Performance**: How you optimized the app for smooth performance
