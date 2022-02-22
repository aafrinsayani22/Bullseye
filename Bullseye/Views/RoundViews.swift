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
            .frame(width: Constants.Generals.roundViewLength, height: Constants.Generals.roundViewLength)
            .cornerRadius(Constants.Generals.roundedRectCornerRadius)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.Generals.strokeWidth)
                        
            )
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: Constants.Generals.roundViewLength, height: Constants.Generals.roundViewLength)
            .overlay(Circle()
                        .strokeBorder(Color("ButtonStrokeColor"), lineWidth: Constants.Generals.strokeWidth)
            )
            .background(Circle().fill(Color("ButtonFilledBackgroundColor")))

    }
}


struct RoundedRectTextView: View {
    var text: String

    var body: some View {

        
        Text(text)
       
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: Constants.Generals.roundRectViewWidth, height: Constants.Generals.roundRectViewHeight)
            .foregroundColor(Color("textColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.Generals.roundedRectCornerRadius)
                    .stroke(lineWidth: Constants.Generals.strokeWidth)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
//
        }
}

struct RoundedTextView: View {
    
    let text: String
    var body: some View {
        
        Text(text)
            .foregroundColor(Color("textColor"))
            .bold()
            .font(.title2)
            .frame(width: Constants.Generals.roundViewLength, height: Constants.Generals.roundViewLength)
            
            .overlay(Circle()
                        .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.Generals.strokeWidth)
        )
    }
}



//struct RoundedLongRectTextView: View {
//    var text: String
//
//    var body: some View {
//
//        HStack(spacing: 40){
//            Text(text)
//                .kerning(-0.2)
//                .bold()
//                .font(.title3)
//                .frame(width: Constants.Generals.roundViewLength, height: 56.0)
//                .foregroundColor(Color("textColor"))
//                .overlay(
//                    RoundedRectangle(cornerRadius: 30.0)
//                        .stroke(lineWidth: Constants.Generals.strokeWidth)
//                        .foregroundColor(Color("ButtonStrokeColor"))
//            )
//
//            Text("10")
//                .kerning(-0.2)
//                .bold()
//                .font(.title3)
//                .foregroundColor(Color("textColor"))
//
//            Text("12:31 PM")
//                .kerning(-0.2)
//                .bold()
//                .font(.title3)
//                .foregroundColor(Color("textColor"))
//        }
////        .padding()
//        .frame(maxWidth: .infinity)
//        .overlay(
//            RoundedRectangle(cornerRadius: 30.0)
//                .stroke(lineWidth: Constants.Generals.strokeWidth)
//                .foregroundColor(Color("ButtonStrokeColor"))
//            )
//
//        }
//}

struct PreviewView: View {
    var body: some View {
        
        VStack {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "1")
            RoundedTextView(text: "1")
            
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
