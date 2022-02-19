//
//  RoundedViews1.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-12-28.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .frame(width: 56.0, height: 56.0)
            .cornerRadius(20)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0, antialiased: true)
                        
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56.0, height: 56.0)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0, antialiased: true)
            )
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))

    }
}


struct RoundedRectTextView: View {
    var title: String
    var score: Int

    var body: some View {
        VStack(spacing: 5) {
            LabelText(text: title.uppercased())
        
            ZStack {
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0, antialiased: true)
                    .frame(width: 68.0, height: 55.78, alignment: .center)
//                game.points(slidervalue: 27)
//                    .fontWeight(.bold)
//                    .font(.title2)
//                    .kerning(-0.2)
//                    .foregroundColor(Color("textColor"))
            }
        }
               
        }
}

struct PreviewView: View {
    var body: some View {
        
        VStack {
            HStack(spacing: 10.0) {
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
                Spacer()
                RoundedImageViewFilled(systemName: "list.dash")
               
            }
            HStack {
                RoundedRectTextView(title: "Score", score: 78)
                Spacer()
                RoundedRectTextView(title: "Round", score: 65)
            }
            
        }
  
       
        
    }
}

struct RoundViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
