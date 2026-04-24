# DI

This folder contains the dependency injection setup for the app.

`Container.swift` uses `Factory` to register shared dependencies such as:

- API endpoint configuration
- The network service
- Feature services for leagues, matches by date, team matches, and standings

This keeps object creation in one place and makes view models less tightly coupled to concrete implementations.
