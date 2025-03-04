//
//  ApiCall.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import Foundation

struct ApiKeys {
    static let list: [(String, String)] = [
        ("akylbekoralov2003", "5224b1c38beea1f12750501e5cc458c0"),
        ("oralovv26", "69459e6f12e2752fa14a2d95b8c64f34"),
        ("akylbek.oralov", "ec719d9fb47e5fa98676aa446b844ecd"),
        ("oakylbek7", "83fe1ed61448e7fccb4a52e024677a34")
    ]
}

class ApiCall {
    static var username: String = ApiKeys.list[0].0
    static var token: String = ApiKeys.list[0].1
}
