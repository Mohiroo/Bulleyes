//
//  Shapes.swift
//  Bulleyes
//
//  Created by Артем Ворфоломеев on 08.06.2021.
//

import SwiftUI

// Изучение работы с фигурами и анимацией

struct Shapes: View {
    @State private var wideShapes = true
    
    var body: some View {
        VStack {
            if !wideShapes {
                Text("❤️")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.largeTitle)
                    .frame(width: 200.0, height: 100.0)
                    .transition(.slide)
            }
            RoundedRectangle(cornerRadius: 20.0)
                .fill(Color.black)
                .frame(width: wideShapes ? CGFloat(200) : CGFloat(100), height: 100.0)
                .animation(.easeInOut)
            Capsule()
                .fill(Color.black)
                .frame(width: wideShapes ? CGFloat(200) : CGFloat(100), height: 100.0)
            Ellipse()
                .fill(Color.black)
                .frame(width: wideShapes ? CGFloat(200) : CGFloat(100), height: 100.0)
            Button(action: {
                withAnimation {
                    wideShapes.toggle()
                }
            }) {
                Text("АНИМАЦИЯ!")
            }


        }
        .background(Color.yellow)
    }
}

struct Shapes_Previews: PreviewProvider {
    static var previews: some View {
        Shapes()
    }
}
