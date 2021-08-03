//
//  TextViews.swift
//  Bulleyes
//
//  Created by Артем Ворфоломеев on 08.06.2021.
//

import SwiftUI

// Шаблоны отображения текста

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .multilineTextAlignment(.center)
            .lineSpacing(10.0)
            .font(.subheadline)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLableText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
            .padding()
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.body)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                Color.accentColor
            )
            .cornerRadius(12.0)
    }
}

struct InButtonText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .font(.title3)
            .foregroundColor(Color("TextColor"))
    }
}

struct ScoreText: View {
    var score: Int
    
    var body: some View {
        Text(String(score))
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct DateText: View {
    var date: Date
    
    var body: some View {
        Text(date, style: .time)
            .bold()
            .kerning(-0.2)
            .foregroundColor(Color("TextColor"))
            .font(.title3)
    }
}

struct BigBoldText: View {
    let text: String
    
    var body: some View {
        Text(text.uppercased())
            .kerning(2.0)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .fontWeight(.black)
    }
}

struct ImageArrow: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
 //           .frame(width: 30, height: 30)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            LabelText(text: "Раунд")
            InButtonText(text: "Счет")
            BodyText(text: "Твой счет 200 баллов\n🎉🎉🎉")
            ButtonText(text: "Начать новый раунд")
            ScoreText(score: 12)
            DateText(date: Date())
            BigBoldText(text: "Цель")
            ImageArrow(systemName: "arrow.right.square")
            
        }
        .padding()
    }
}

