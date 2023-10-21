//
//  HomeView.swift
//  GREENTRaiL
//
//  Created by Luke Atkins on 10/21/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 390, height: 125)
                .background(Color(red: 0.13, green: 0.32, blue: 0.41))
                .cornerRadius(33)
                
            
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
    HomeView()
}
