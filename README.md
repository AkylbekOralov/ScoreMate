# ScoreMate

ScoreMate is a SwiftUI iOS app for exploring football leagues, standings, team fixtures, and daily matches. I built it as a hands-on project to strengthen my iOS fundamentals and to practice writing code that is clean, structured, and easy to extend.

## What It Shows

- SwiftUI app structure with reusable screens and components
- MVVM presentation flow with dedicated view models per feature
- Network layer separated from UI and business logic
- Dependency injection with `Factory`
- Light and dark mode support
- Mock-data driven development for safer UI iteration

## Features

- Browse football leagues
- Open league standings
- View finished and upcoming matches for a team
- Check matches by selected date
- Switch app theme in Settings

## Architecture

The project follows an MVVM-style structure:

- `View`: renders UI and handles user interaction
- `ViewModel`: owns screen state and coordinates data loading
- `Service`: fetches and maps remote data
- `Model` / `Response`: keeps domain models separate from API payloads

For dependency injection, the `DI` folder contains a `Factory` container. It registers shared dependencies such as API endpoints, the network service, and feature services. This keeps view models easier to test, reduces tight coupling, and makes the project more consistent as it grows.

## Project Structure

```text
ScoreMate
├── Components/          # Reusable SwiftUI views
├── DI/                  # Dependency injection container built with Factory
├── Model/               # App domain models
├── MockData/            # Local JSON files for previewing and development
├── Network/
│   ├── NetworkService/  # Core networking, endpoints, config, errors
│   ├── Requests/        # Feature-specific services
│   └── Responses/       # API response models
├── Screens/             # Feature screens, views, and view models
├── UI/                  # Design constants and shared UI helpers
├── Assets.xcassets/     # Images and app assets
├── Colors.xcassets/     # Color palette
└── ScoreMateApp.swift   # App entry point
```

This structure helps me keep responsibilities clear: UI stays inside feature screens, shared views live in `Components`, networking stays isolated, and design values are centralized in `UI`.

## Tech Stack

- Swift
- SwiftUI
- MVVM
- Alamofire
- Factory
- DebugSwift

## Screenshots

<p align="left">  
  <img src="https://github.com/user-attachments/assets/923dafa4-e630-4ca2-8e9e-daeebb7b774d" width="200">
  <img src="https://github.com/user-attachments/assets/a04deb03-4af5-40a3-8f2e-a28e756238bb" width="200">
  <img src="https://github.com/user-attachments/assets/db748a1f-7ed2-4302-9e2e-7cb6f60f0ea2" width="200">
  <img src="https://github.com/user-attachments/assets/5397de14-e87f-43ae-8241-0a2caf58743d" width="200">
  <img src="https://github.com/user-attachments/assets/7456f1bf-21f1-4a7a-b569-876f46e18014" width="200">
  <img src="https://github.com/user-attachments/assets/b8502305-2ae0-46f4-904a-c9c5dfbda474" width="200">
  <img src="https://github.com/user-attachments/assets/3e10b09e-377a-43f9-8854-e193d0abfe1a" width="200">
  <img src="https://github.com/user-attachments/assets/b9264350-0610-4f8b-8185-a3d630b8c1ee" width="200">
  
  <br>

  <img src="https://github.com/user-attachments/assets/85ec769e-ea05-4e54-9a3e-50f02e2fe78b" width="200">
  <img src="https://github.com/user-attachments/assets/5bdb5fea-743d-4ef8-9bdc-c5acd34bdbae" width="200">
  <img src="https://github.com/user-attachments/assets/4dc784bb-42cf-46a1-b487-460368fd7721" width="200">
  <img src="https://github.com/user-attachments/assets/e804ae7a-7272-4f8e-919f-3a3a10353bc8" width="200">
  <img src="https://github.com/user-attachments/assets/a7159d9f-91c9-4a2d-bbdb-8eddf3a5b3e9" width="200">
  <img src="https://github.com/user-attachments/assets/6bfbb92e-dcd2-47a6-92b9-50d7352047c8" width="200">
  <img src="https://github.com/user-attachments/assets/024572e9-ffc6-4dd2-9974-44818be28e6b" width="200">
</p>
