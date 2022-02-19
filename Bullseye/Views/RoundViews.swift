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
    var text: String

    var body: some View {

        
        Text(text)
       
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .frame(width: 68.0, height: 56.0)
            .foregroundColor(Color("textColor"))
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(Color("ButtonStrokeColor"))
            )
//
        }
}

struct PreviewView: View {
    var body: some View {
        
        VStack {
            RoundedImageViewStroked(systemName: "arrowcounterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "1")
            
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
