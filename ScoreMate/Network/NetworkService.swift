//
//  NetworkService.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 04.03.2025.
//

import Foundation
import Alamofire

class NetworkService {
    static func getData<T: Decodable>(
        url: String,
        dataType: T.Type,
        completion: @escaping (Result<T, APIError>) -> Void) {
            
            AF.request(url, method: .get)
                .validate()
                .responseDecodable(of: dataType.self) { response in
                    switch response.result {
                    case .success(let successfulResponse):
                        completion(.success(successfulResponse))
                    case .failure(let error):
                        completion(.failure(.requestFailed(error.localizedDescription)))
                    }
                }
        }
}

