//
//  APIEndpoints.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 04.03.2025.
//

public class APIEndpoints {
    public static let shared = APIEndpoints()
    
    private let baseURL = "https://api.soccersapi.com/v2.2"
    private let api: ApiCall
    private let user: String
    private let token: String
    
    init() {
        api = ApiCall()
        user = api.username
        token = api.token
    }
    
    public func leagues() -> String {
        return "\(baseURL)/leagues/?user=\(user)&token=\(token)&t=list"
    }
    
    public func leagueStanding(seasonId: String) -> String {
        return "\(baseURL)/leagues/?user=\(user)&token=\(token)&t=standings&season_id=\(seasonId)"
    }
    
    public func matchesByDate(date: String) -> String {
        return "\(baseURL)/fixtures/?user=\(user)&token=\(token)&t=schedule&d=\(date)"
    }
    
    public func teamMatches(seasonId: String, teamId: String) -> String {
        return "https://api.soccersapi.com/v2.2/fixtures/?user=\(user)&token=\(token)&t=season&season_id=\(seasonId)&team_id=\(teamId)"
    }
}

fileprivate class ApiCall {
    private let index = 1
    private let encryptedList: [(String, String)] = [
        ("leSjMEi+SeR7oTfvJZfbMXJbnQhxaLTnj+BrN7ksjQ5ED0kWAYnHjGi/fpIQ", "bMadb+V/c425SiG4/qgU8FbcZwzZo9knG6C1Cxm+AuA8XxnIacRUkhcQCkvmUA6j4c/l03QfPen6TfE6"),
        ("8UKThCX/H+tR8nXEgaVpyoV0TSITB5+m0uFoABcCFb6rpdU/OQ==", "Da3o/fbcAfuDOcEwHYckj0uJOIQZa3ftTXrFng0V+rRVTgqFXcGLJDaITgpeWQ+4yCfZX0RtFSPLU+rr"),
        ("GvRhC04NJCegArHBhs2BXTiIn43EXhXDcZDlPYjoSQWiBV8QMldCer7y", "5pgPI7D5qlks68Hcp2QsthYlyVImQBgKXyiIWqy/S810R/AJ8M7uYz+AlZFkfWCX/b/Uz0qk0+el0qdB"),
        ("PpuAVwKazOdEF0D9P8xSNGZE6qx7l3+TlAWyyNqBI+i4iq3Rqg==", "JeKgWqX4rr9pmW7WheVpQwHHt28BJgJq8Va0CDKU3nxOnCtR+abyxgMV1bRoNOve9qR8JLFdQDIH1a9f")
    ]
    
    var username: String {
        return EncryptionHelper.decrypt(base64Ciphertext: encryptedList[index].0) ?? ""
    }

    var token: String {
        return EncryptionHelper.decrypt(base64Ciphertext: encryptedList[index].1) ?? ""
    }
}
