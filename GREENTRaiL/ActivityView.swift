//
//  ActivityView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct ActivityView: View {
    
    @State private var label_string = "Get Activity"
    @State private var route_label = "Select Route"
    
    var body: some View {
        
        ZStack{
            
            Image("APP BRAND WHITE")
                .frame(width: 42, height: 35.46667)
                .offset(CGSize(width:25, height: -270))
            
            Image("Vector 3")
                .offset(CGSize(width:0, height: 200))
            
            Image("Vector 12")
                .offset(CGSize(width:20, height: 153))
            VStack{
                
                Button {
                        route_label = "Coyote Hills"
                    } label: {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 98)
                        .background(Color(red: 0.93, green: 0.6, blue: 0.45))
                        .cornerRadius(56)
                        .overlay(Text(route_label)
                            .font(
                            Font.custom("Fredoka", size: 32)
                            .weight(.bold)
                            )
                            .foregroundColor(.white))
                        
                        
                    }
                Button {
                    
                    label_string = "Loading..."
                    
                    var end = Date()
                    
                    let formatter = DateFormatter()
                    formatter.dateFormat = "yyyy/MM/dd HH:mm"
                    let start = formatter.date(from: "2023/10/11 22:31")
                    requestActivity(startDate: start!, endDate: end, resource:ContentView.resource!) { w in
                        
                        let originalString = w.startTime
                        let startIndex = originalString.index(originalString.startIndex, offsetBy: 0) // Index where the slice starts
                        let endIndex = originalString.index(originalString.startIndex, offsetBy: 10) // Index where the slice ends

                        let slicedString = originalString[startIndex..<endIndex]
                        label_string = String(slicedString)
                        
                        print(w)
                    }
                    
                    } label: {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 98)
                        .background(Color(red: 0.93, green: 0.6, blue: 0.45))
                        .cornerRadius(56)
                        .overlay(Text(label_string)
                            .font(
                            Font.custom("Fredoka", size: 32)
                            .weight(.bold)
                            )
                            .foregroundColor(.white))
                    }
                Button {
                    
                    label_string = "Get Activity"
                    route_label = "Select Route"
                    
                    } label: {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 350, height: 98)
                        .background(Color(red: 1, green: 0.71, blue: 0.07))
                        .cornerRadius(56)
                        .overlay(Text("Submit")
                            .font(
                            Font.custom("Fredoka", size: 32)
                            .weight(.bold)
                            )
                            .foregroundColor(.white))
                    }
            }
            .padding([.top], 300)
          

            VStack{
                Text("greentr       l ")
                .font(
                Font.custom("Fredoka", size: 30)
                .weight(.semibold)
                )
                .foregroundColor(.white)

                .frame(width: 200, height: 26, alignment: .topLeading)
                .offset(CGSize(width:0, height: -240))
                
                Image("Ellipse 2")
                    .offset(CGSize(width:0, height: -90))
                
            
            }
            
           
            
        }
        .frame(width: 390, height: 844)
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1), location: 0.00),
                    Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1).opacity(0), location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0.27),
                endPoint: UnitPoint(x: 0.5, y: 0.75)
            )
        )
        
    }
}

#Preview {
    ActivityView()
}
