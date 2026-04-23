//
//  MockDataLoader.swift
//  ScoreMate
//
//  Created by Codex on 24.04.2026.
//

import Foundation

enum MockDataLoader {
    static func load<T: Decodable>(
        fileName: String,
        as dataType: T.Type
    ) -> Result<T, APIError> {
        guard let url = mockFileURL(fileName: fileName) else {
            return .failure(.requestFailed("Mock file \(fileName).json was not found in the app bundle."))
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedResponse = try JSONDecoder().decode(dataType.self, from: data)
            return .success(decodedResponse)
        } catch {
            return .failure(.decodingError("Mock file \(fileName).json could not be decoded: \(error.localizedDescription)"))
        }
    }
    
    private static func mockFileURL(fileName: String) -> URL? {
        if let subdirectoryURL = Bundle.main.url(
            forResource: fileName,
            withExtension: "json",
            subdirectory: "MockData"
        ) {
            return subdirectoryURL
        }
        
        return Bundle.main.url(forResource: fileName, withExtension: "json")
    }
}
