//
//  ContentView.swift
//  Bullseye
//
//  Created by Aafrin Sayani on 2021-10-21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        
        
        ZStack {
            BackgroundView(game: $game)
            VStack {
                InstructionView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible:  $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
                else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)

                }
                
                
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
                    .transition(.scale)

            }
    
        }
    }
    
    struct InstructionView: View {
        @Binding var game: Game
        var body: some View{
            VStack{
                InstructionText(text: "🎯🎯🎯\nPUT THE BULLS EYE AS CLOSE AS YOU CAN TO.")
                    .padding(.leading, 30.0)
                    .padding(.trailing, 30.0)
               BigNumberText(text: String(game.target))

            }
        }
    }
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 568, height: 320))
            
           
        }
    }
}



struct SliderView: View {
    @Binding var sliderValue: Double
    
   
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
            
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            withAnimation{
                alertIsVisible = true
                
            }
        }) {
            Text("Hit me".uppercased())
                .font(.title3)
                .bold()
                
            
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor");LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            })
        .foregroundColor(Color.white)
        .cornerRadius(Constants.Generals.roundedRectCornerRadius)
        .overlay(RoundedRectangle(cornerRadius: Constants.Generals.roundedRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.Generals.strokeWidth, antialiased: true))
        
    }
}
