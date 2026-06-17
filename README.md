# Salang Coffee

Salang Coffee is an iOS coffee ordering app built with SwiftUI. The app provides a simple mobile experience for browsing coffee menus, adding items to an order, and viewing user profile settings.

## Features

- Home screen with search, promotion banner, favorite menu carousel, and coffee categories
- Order screen with coffee menu cards, cart quantity controls, total payment, and checkout alert
- Profile screen with user information, saved address, payment, help center, settings, privacy, and logout options
- Bottom tab navigation for Home, Order, and Profile
- Local sample coffee data using the MVVM pattern

## Tech Stack

- Swift
- SwiftUI
- Xcode
- iOS

## Project Structure

```text
SalangCoffeeApp/
+-- SalangCoffee.xcodeproj
+-- SalangCoffee/
    +-- App/
    |   +-- SalangCoffeeApp.swift
    |   +-- ContentView.swift
    +-- Views/
    |   +-- HomeView.swift
    |   +-- OrderView.swift
    |   +-- ProfileView.swift
    +-- MVVM/
    |   +-- Coffee.swift
    |   +-- CoffeeView.swift
    |   +-- ViewModel.swift
    +-- Assets.xcassets/
```

## Getting Started

1. Open the project folder in Xcode.
2. Open `SalangCoffee.xcodeproj`.
3. Select an iPhone simulator.
4. Press `Run` or use `Cmd + R`.

## Notes

This project is intended as a SwiftUI learning project and can be expanded with real product data, authentication, order history, and backend integration.
