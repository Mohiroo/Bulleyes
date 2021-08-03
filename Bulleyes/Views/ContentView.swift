//
//  ContentView.swift
//  Bulleyes
//
//  Created by Артем Ворфоломеев on 07.06.2021.
//

import SwiftUI

// Полный вид приложения со всеми элементами

struct ContentView: View {
    @State private var alertIsVisible = false
    @State public var targetIsVisible = true
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                if targetIsVisible {
                InstructionsViews(game: $game)
                    .padding(.bottom, CGFloat(100))
                }
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, targetIsVisible: $targetIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, targetIsVisible: $targetIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                }
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue)
            }
        }
    }
}

struct InstructionsViews: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "🎯 🎯 🎯 \n МИШЕНЬ - попади в цель")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLableText(text: "1")
            Slider(value: $sliderValue, in: 1...100)
            SliderLableText(text: "100")
        }
        .padding()
    }
}

struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var targetIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    alertIsVisible = true
                    targetIsVisible = false
                }
                game.endRound(points: game.points(sliderValue: sliderValue))
            }) {
                Text("Нажми".uppercased())
                    .bold()
                    .font(.title3)
            }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth)
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
