# NewsReaderApp

A news reading application developed as part of a technical challenge for a mobile position. This project is written in **Swift** and utilizes the **JSONPlaceholder** public API to fetch fake news and user data.

## Contents

1. [Introduction](#introduction)
2. [Architecture](#architecture)
3. [Application Screens](#application-screens)
4. [Libraries and Tools Used](#libraries-and-tools-used)
5. [Design Decisions](#design-decisions)
6. [How to Run the Project](#how-to-run-the-project)
7. [Unit Testing](#unit-testing)

---

## Introduction

This mobile application includes the following core functionalities:
- A list of news articles with integrated search functionality (Home Screen).
- A detailed view of a selected news article (Detail Screen).
- A list of users with their basic information (User List Screen).
- Display of a user’s location on a map (Map Screen).

The [JSONPlaceholder](https://jsonplaceholder.typicode.com/) public API is used to fetch data for both news articles and users.

---

## Architecture

The project follows the **MVVM (Model-View-ViewModel)** design pattern, which allows:
- Separation of business logic from the view.
- Easier unit testing.
- Improved maintainability and scalability.

### Key Components:
1. **Models**:
   - Represent the data structure (e.g., `Post`, `User`).
2. **Views**:
   - Contains the main screens, built using **SwiftUI**.
3. **ViewModels**:
   - Handles business logic and communicates with views using **Combine** for reactivity.
4. **Services**:
   - The `APIService` class manages HTTP requests using `URLSession`.

---

## Application Screens

### 1. Home Screen:
   - Displays a list of news articles fetched from the API.
   - Includes a search bar to filter articles by title or content.

### 2. Detail Screen:
   - Shows the full title and body of the selected news article.

### 3. User List Screen:
   - Displays a list of users with their name, email, and a button to open their location on a map.

### 4. Map Screen:
   - Shows the selected user’s location on **Google Maps**.
   - Uses coordinates provided by the JSONPlaceholder API.

---

## Libraries and Tools Used

1. **Google Maps SDK for iOS**:
   - To integrate interactive maps for the user location screen.
   - [Library link](https://developers.google.com/maps/documentation/ios-sdk).

2. **Combine**:
   - For managing reactivity between ViewModels and Views.

3. **SwiftUI**:
   - For building modern, responsive user interfaces.

4. **JSONPlaceholder API**:
   - [JSONPlaceholder](https://jsonplaceholder.typicode.com/) was used as the source for fake data for news articles and users.

5. **MockURLProtocol**:
   - For simulating API responses during unit testing.

---

## Design Decisions

1. **MVVM**:
   - The MVVM pattern was chosen to separate responsibilities, making views simpler and reusable.

2. **SwiftUI**:
   - SwiftUI was used to leverage declarative design and adapt to various screen sizes seamlessly.

3. **Modular Design**:
   - Network logic is encapsulated in the `APIService` class to keep the code clean and testable.

4. **Google Maps SDK**:
   - Integrated for a smooth user experience when displaying user locations.

---

## How to Run the Project

### Requirements:
- **Xcode 15** or later.
- A device or simulator running **iOS 15** or later.
- A Google Maps API key enabled for the iOS SDK.

### Instructions:
1. Clone this repository:
   ```bash
   git clone <https://bitbucket.org/matias_blum/newsreaderapp>
   ```
2. Open the `NewsReaderApp.xcodeproj` file in Xcode.
3. In the `AppDelegate.swift` file, add your Google Maps API key:
   ```swift
   GMSServices.provideAPIKey("YOUR_API_KEY")
   ```
4. Run the app on a simulator or physical device.

---

## Unit Testing

Unit tests were written using **XCTest**. The tests include:
- Verifying that API responses are decoded correctly (`fetchPosts` and `fetchUsers`).
- Validating that the camera and markers on Google Maps are set up correctly.
- Using `MockURLProtocol` to simulate API responses and eliminate external dependencies during tests.

To run the tests:
1. Open the project in Xcode.
2. Press `Cmd + U` or select **Product > Test** from the menu.

---

