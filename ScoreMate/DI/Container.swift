//
//  Container.swift
//  ScoreMate
//
//  Created by Codex on 24.04.2026.
//

import FactoryKit
import Foundation

extension Container {
    var colors: Factory<Colors> {
        self { @MainActor in Colors() }.singleton
    }
    
    var apiEndpoints: Factory<APIEndpoints> {
        self { APIEndpoints() }.singleton
    }
    
    var networkServing: Factory<NetworkServing> {
        self { DefaultNetworkService() }.singleton
    }
    
    var leaguesService: Factory<LeaguesServicing> {
        self { LeaguesService(apiEndpoints: self.apiEndpoints(), networkService: self.networkServing()) }
    }
    
    var matchesByDateService: Factory<MatchesByDateServicing> {
        self { MatchesByDateService(apiEndpoints: self.apiEndpoints(), networkService: self.networkServing()) }
    }
    
    var teamMatchesService: Factory<TeamMatchesServicing> {
        self { TeamMatchesService(apiEndpoints: self.apiEndpoints(), networkService: self.networkServing()) }
    }
    
    var leagueStandingService: Factory<LeagueStandingServicing> {
        self { LeagueStandingService(apiEndpoints: self.apiEndpoints(), networkService: self.networkServing()) }
    }
}
