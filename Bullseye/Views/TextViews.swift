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
        Text(text.uppercased())
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

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            
            .lineSpacing(12)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(Constants.Generals.roundedRectCornerRadius)
    }
        
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .foregroundColor(Color("textColor"))
            .bold()
            .font(.title2)
       
        
    }
        
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(String(text.uppercased()))
            .kerning(2.0)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Color("textColor"))
        
    }
        
}


struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .foregroundColor(Color("textColor"))
            .bold()
            .font(.title2)
    }
        
}


struct TextViews_Previews: PreviewProvider {

    static var previews: some View {
        VStack(alignment: .center, spacing: 10) {
            InstructionText(text: "????????????\nPUT THE BULLS EYE AS CLOSE AS YOU CAN TO.")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "Score".uppercased())
            BodyText(text: "You Scored 73 Points\n ????????????")
            ButtonText(text: "Start New Round")
            ScoreText(score: 459)
            DateText( date: Date())
            BigBoldText(text: "Leaderboard")
        }
        .padding()
        
    }
}




