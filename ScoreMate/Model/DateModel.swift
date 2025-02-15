//
//  DateModel.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 15.02.2025.
//

import Foundation

public struct DateModel: Identifiable {
    let dayOfWeek: String
    let dateString: String
    let fullDateString: String
    
    public var id: String { fullDateString }
}
