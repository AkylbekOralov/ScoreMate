# ScoreMate

This is a SwiftUI iOS app for exploring football leagues, standings, team fixtures, and daily matches. I built it as a hands-on project to strengthen my iOS fundamentals and to practice writing code that is clean, structured, and easy to extend.

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

## Screenshots

<p align="center">  
  <img src="https://github.com/user-attachments/assets/923dafa4-e630-4ca2-8e9e-daeebb7b774d" width="200">
  <img src="https://github.com/user-attachments/assets/659170d2-db07-4847-96fb-11c0d964bfa0" width="200"/>
  <img src="https://github.com/user-attachments/assets/ad454523-d700-4a30-bdf0-a9a73b6a842f" width="200"/>
  <img src="https://github.com/user-attachments/assets/dca47965-5487-47f2-9461-e422fa7e497d" width="200"/>
  <img src="https://github.com/user-attachments/assets/6a5f9b80-b497-4c79-a92b-07f873435b77" width="200"/>
  <img src="https://github.com/user-attachments/assets/2f1a7534-16b9-47c4-8444-88356c095512" width="200"/>
  <img src="https://github.com/user-attachments/assets/e2411882-6488-494b-903f-b94d15e7f6af" width="200"/>
  <img src="https://github.com/user-attachments/assets/779bdb35-5ac2-4b1b-be68-34b0c064221d" width="200"/>
</p>

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
├── DI/                  # Dependency injection container built with Factory
├── Model/               # App domain models
├── MockData/            # Local JSON files for previewing and development
├── Network/
│   ├── NetworkService/  # Core networking, endpoints, config, errors
│   ├── Requests/        # Feature-specific services
│   └── Responses/       # API response models
├── Screens/             # Feature screens, views, and view models
├── UI/
│   ├── Components/      # Reusable SwiftUI views
│   └── ...              # Design constants and shared UI helpers
├── Assets.xcassets/     # Images and app assets
├── Colors.xcassets/     # Color palette
└── ScoreMateApp.swift   # App entry point
```

This structure helps me keep responsibilities clear: UI stays inside feature screens, shared views live in `UI/Components`, networking stays isolated, and design values are centralized in `UI`.

### Folder Guides

- [DI](ScoreMate/DI/README.md)
- [Model](ScoreMate/Model/README.md)
- [Network](ScoreMate/Network/README.md)
- [Screens](ScoreMate/Screens/README.md)
- [UI](ScoreMate/UI/README.md)
- [UI Components](ScoreMate/UI/Components/README.md)

## Tech Stack

- Swift
- SwiftUI
- MVVM
- Alamofire
- Factory
- DebugSwift
