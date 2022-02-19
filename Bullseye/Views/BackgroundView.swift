//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-12-28.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    var body: some View {
        VStack{
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all))
    }
}

struct TopView: View {
    @Binding var game: Game
    var body: some View {
        HStack() {
            Button(action: {
                game.restart()
            }) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            
            Spacer()
            RoundedImageViewFilled(systemName: "list.dash")
               
        }
    }
}




struct BottomView: View {
    @Binding var game: Game
    var body: some View {
        HStack() {
            RoundedRectTextView(title: "Score", score: game.score)
            Spacer()
            RoundedRectTextView(title: "Round", score: game.round)
               
        }
    }
}



struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
