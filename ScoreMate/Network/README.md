# Network

This folder contains the networking layer.

It is split into three parts:

- `NetworkService`: shared networking code, endpoints, configuration, mock loading, and error handling
- `Requests`: feature-oriented services that fetch data
- `Responses`: API response models used for decoding

This separation keeps the data flow predictable and prevents networking details from leaking into the UI layer.
