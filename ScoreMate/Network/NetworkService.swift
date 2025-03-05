//
//  Untitled.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 04.03.2025.
//

// TODO: перетащить в NetworkService и сложить туда url

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

