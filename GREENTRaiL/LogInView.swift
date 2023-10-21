//
//  LogInView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            Image("Vector 3")
            VStack {
                Image("home logo")
                .padding([.top], 200)
                
                ZStack {
                    Text("greentr        l ")
                        .font(
                            Font.custom("Fredoka-SemiBold", size: 20)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.74, green: 0.39, blue: 0.22))
                    Image("APP BRAND")
                }
                .padding([.top], 200)

                Text("let’s explore together! ")
                  .font(
                    Font.custom("Fredoka-Light", size: 13)
                  )
                  .foregroundColor(Color(red: 0.74, green: 0.39, blue: 0.22))
            }
        }
        .padding()
        .frame(width: 390, height: 844)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1).opacity(0), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0.27),
                endPoint: UnitPoint(x: 0.5, y: 0.45)
            )
        )
        
    }
}

#Preview {
    LogInView()
}
