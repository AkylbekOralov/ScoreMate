//
//  LeagueListView.swift
//  ScoreMate
//
//  Created by Akylbek Oralov on 29.01.2025.
//

import SwiftUI

struct LeagueListView: View {
    @StateObject var viewModel: LeagueListViewModel
    let screenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(spacing: 0) {
                    VStack(spacing: 0) {
                        Text("Football Leagues")
                            .font(.system(size: FontSizes.large, weight: .bold))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, Paddings.x13)
                    .padding(.bottom, Paddings.x8)
                    
                    VStack {
                        if viewModel.loading {
                            JumpingBallView()
                            Spacer()
                        } else {
                            VStack (alignment: .leading, spacing: Paddings.x6) {
                                ForEach(viewModel.leagues) { league in
                                    VStack {
                                        HStack(spacing: Paddings.x2) {
                                            CountryImageView(countryCode: league.countryCode)
                                                .frame(width: 35, height: 35)
                                            Text(league.countryName)
                                                .font(.subheadline)
                                                .font(.system(size: FontSizes.small, weight: .light))
                                                .foregroundColor(.black)
                                        }
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .padding(.leading, Paddings.x2)
                                        NavigationLink {
                                            LeagueStandingView(leagueStandingViewModel: LeagueStandingViewModel(leagueModel: league))
                                        } label: {
                                            VStack {
                                                LeagueView(leagueModel: league)
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                        }
                    }
                }
                .frame(width: screenWidth*0.9)
                Spacer()
            }
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .center
            )
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
        }
        
    }
}

struct LeagueListView_Preview: PreviewProvider {
    static var previews: some View {
        LeagueListView(viewModel: LeagueListViewModel())
    }
}
