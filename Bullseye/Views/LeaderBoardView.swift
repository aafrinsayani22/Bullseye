//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2022-02-21.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing : Bool
    @Binding var game: Game
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing : 10) {
                    HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                    LabelView()
                    VStack(spacing: 10) {
                        ForEach( game.leaderBoardEntries.indices) {i in
                            let leaderBoardEntry = game.leaderBoardEntries[i]
                            RowViewView(index: i+1, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
                            
                        }
                    }
                }
            }
        }
    }
}

struct HeaderView: View {
    
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Binding var leaderBoardIsShowing : Bool
    var body: some View {
        ZStack {
            HStack {
                
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "LeaderBoard")
                        .padding()
                    Spacer()
                }
                else {
                    BigBoldText(text: "LeaderBoard")
                    
                }
            }
            .padding()
            .padding(.top)
            HStack {
                Spacer()
                
                    
                Button(action: {
                    leaderBoardIsShowing = false
                })
                {
                    RoundedImageViewFilled(systemName: "xmark")
                }.padding()
            }
        }
    }
}

struct LabelView : View {
    var body: some View {
        HStack {
            Spacer()
                .frame(width: Constants.Generals.roundViewLength)
            Spacer()
            LabelText(text: "Score")
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidth)
            LabelText(text: "Date")
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)
        }
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct RowViewView: View {
    
    let index: Int
    let score: Int
    let date: Date
    
    var body: some View {
        
        HStack {
            RoundedTextView(text: String(index))
            Spacer()
            ScoreText(score: score)
                .frame(width: Constants.LeaderBoard.leaderBoardScoreColWidth)
            Spacer()
            DateText(date: Date())
                .frame(width: Constants.LeaderBoard.leaderBoardDateColWidth)
    //        Slider(value: .constant(50.0))
               
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.Generals.strokeWidth)
        )
        .padding(.leading)
        .padding(.trailing)
        .frame(maxWidth: Constants.LeaderBoard.leaderBoardMaxRowWidth)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static private var leaderBoardIsShowing = Binding.constant(false)
    static private var game = Binding.constant(Game(loadTestData: true))
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game )

        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing,  game: game )
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game )
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing, game: game )
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
    }
}
