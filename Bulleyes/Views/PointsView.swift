//
//  PointsView.swift
//  Bulleyes
//
//  Created by Артем Ворфоломеев on 14.06.2021.
//

import Foundation
import SwiftUI

// Объявление о законченном раунде с количеством заработанных очков

struct PointsView: View {
    @Binding var alertIsVisible: Bool
    @Binding var targetIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {        
        VStack (spacing: 15) {
            ScoreView(sliderValue: $sliderValue, game: $game)
            Button(action: {
                withAnimation {
                    alertIsVisible = false
                    targetIsVisible = true
                    game.startNewRound()
                }
            }) {
                ButtonText(text: "Начать новый раунд")
                
            }
        }
            .padding()
            .frame(maxWidth: 300, maxHeight: 300)
            .background(Color("BackgroundColor"))
            .cornerRadius(Constants.General.roundedRectCornerRadius)
            .shadow(radius: 100, x: 5, y: 5)
            .transition(.scale)
            .overlay(
                RoundedRectangle(cornerRadius: Constants.General.roundedRectCornerRadius)
                    .strokeBorder(Color.red, lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct ScoreView: View {
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        let points = game.points(sliderValue: sliderValue)
        HStack {
            VStack (spacing: 5) {
                InstructionText(text: "Цель")
                BigNumberText(text: String(game.target))
            }
            .frame(maxWidth: 100)
            Spacer()
            ImageArrow(systemName: "arrowtriangle.right.fill")
            Spacer()
            VStack (spacing: 5) {
                InstructionText(text: "Отметка")
                BigNumberText(text: String(Int(sliderValue.rounded())))
            }
            .frame(maxWidth: 100)
        }
    
        BodyText(text: "Твой счет \(points) очков\n🎉🎉🎉")

    }
}

struct PointsView_Previews: PreviewProvider {
    
    static private var alertIsVisible = Binding.constant(false)
    static private var targetIsVisible = Binding.constant(false)
    static private var sliderValue = Binding.constant(50.7)
    static private var game = Binding.constant(Game())
    
    static var previews: some View {
        PointsView(alertIsVisible: alertIsVisible, targetIsVisible: targetIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.light)
        PointsView(alertIsVisible: alertIsVisible, targetIsVisible: targetIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
        PointsView(alertIsVisible: alertIsVisible, targetIsVisible: targetIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.light)
            .previewLayout(.fixed(width: 568, height: 320))
        PointsView(alertIsVisible: alertIsVisible, targetIsVisible: targetIsVisible, sliderValue: sliderValue, game: game)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
