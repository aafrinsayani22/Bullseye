//
//  TextViews.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-12-24.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("textColor"))
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .padding()
    }
}

struct SliderLabelText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("textColor"))
            .frame(width: 35.0)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(Color("textColor"))
            .kerning(-1.0)
            .fontWeight(.black)
            .font(.largeTitle)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(1.5)
            .fontWeight(.bold)
            .font(.footnote)
            .foregroundColor(Color("textColor"))
    }
}


struct TextViews_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nPUT THE BULLS EYE AS CLOSE AS YOU CAN TO.")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "Score".uppercased())
        }
        
    }
}




