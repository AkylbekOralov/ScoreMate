//
//  LeagueViewModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 30.01.2025.
//

import Foundation
import Alamofire

class LeagueViewModel: ObservableObject {
    var leagueModel: LeagueModel
    @Published var country_img: String?
    
    init(leagueModel: LeagueModel) {
        self.leagueModel = leagueModel
        fetchImage()
    }
    
    func fetchImage() {
        let url = "https://api.soccersapi.com/v2.2/countries/?user=oralovv26&token=69459e6f12e2752fa14a2d95b8c64f34&t=info&id=\(leagueModel.country_id)"
        
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: CountryResponse.self) { response in
                switch response.result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self.country_img = data.data.img
                    }
                case .failure(let error):
                    print("Error fetching country image: \(error.localizedDescription)")
                }
            }
    }
}

struct CountryResponse: Decodable {
    let data: CountryData
}

struct CountryData: Decodable {
    let img: String?
}
