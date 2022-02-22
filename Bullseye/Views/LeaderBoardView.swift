//
//  LeaderBoardView.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2022-02-21.
//

import SwiftUI

struct LeaderBoardView: View {
    @Binding var leaderBoardIsShowing : Bool
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack(spacing : 10) {
                HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
                LabelView()
                RowViewView(index: 1, score: 10, date: Date())
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
            ScoreText(score: 459)
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
    static var previews: some View {
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing)
            .preferredColorScheme(.dark)
        LeaderBoardView(leaderBoardIsShowing: leaderBoardIsShowing)
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
    }
}
