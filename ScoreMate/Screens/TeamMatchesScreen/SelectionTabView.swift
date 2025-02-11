//
//  SelectionTabView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 11.02.2025.
//

import SwiftUI

struct SelectionTabView: View {
    
    @StateObject var teamMatchesViewModel: TeamMatchesViewModel
    
    var body: some View {
        HStack {
            Text("Results")
                .foregroundColor(teamMatchesViewModel.selection == .results ? .accentColor : .primary)
                .underline(teamMatchesViewModel.selection == .results, color: .accentColor)
                .onTapGesture {
                    teamMatchesViewModel.changeSelection(selected: .results)
                }
            
            Text("Calendar")
                .foregroundColor(teamMatchesViewModel.selection == .calendar ? .accentColor : .primary)
                .underline(teamMatchesViewModel.selection == .calendar, color: .accentColor)
                .onTapGesture {
                    teamMatchesViewModel.changeSelection(selected: .calendar)
                }
            Spacer()
        }
        .padding(.leading, 20)
        .padding(.vertical, 10)
        .background(Color.green.opacity(0.7))
    }
}
