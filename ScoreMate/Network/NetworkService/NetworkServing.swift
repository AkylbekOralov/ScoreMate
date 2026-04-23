//
//  NetworkServing.swift
//  ScoreMate
//
//  Created by Codex on 24.04.2026.
//

import Foundation

protocol NetworkServing: Sendable {
    func getData<T: Decodable>(
        url: String,
        dataType: T.Type,
        mockFileName: String,
        completion: @escaping (Result<T, APIError>) -> Void
    )
}
