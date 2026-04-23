//
//  NetworkService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 04.03.2025.
//

import Foundation
import Alamofire

final class DefaultNetworkService: NetworkServing {
    func getData<T: Decodable>(
        url: String,
        dataType: T.Type,
        mockFileName: String,
        completion: @escaping (Result<T, APIError>) -> Void
    ) {
            if NetworkConfiguration.useMockData {
                completion(MockDataLoader.load(fileName: mockFileName, as: dataType))
                return
            }
            
            AF.request(url, method: .get)
                .validate()
                .responseData { response in
                    switch response.result {
                    case .success(let data):
                        do {
                            let decodedResponse = try JSONDecoder().decode(dataType.self, from: data)
                            completion(.success(decodedResponse))
                        } catch {
                            completion(.failure(.requestFailed("Response could not be decoded because of error: \(error.localizedDescription)")))
                        }
                    case .failure(let error):
                        completion(.failure(.requestFailed(error.localizedDescription)))
                    }
                }
        }
}
