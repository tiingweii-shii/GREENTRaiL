//
//  ContentView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("Vector 3")

            Image("home logo")

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
    ContentView()
}
