//
//  LogInView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct LogInView: View {
    
    var widgetHandler = WidgetHandler()
    
    var body: some View {
        ZStack {
            Image("Vector 3")
            VStack {
                Image("home logo")
                .padding([.top], 200)
                Button(action: {
                        /*widgetHandler.displayWidget { success, _userId, _resource  in
                            if success {
                                ContentView.userId = _userId
                                ContentView.resource = _resource
                                print(ContentView.userId!)
                                print(ContentView.resource!)
                            }
                        }*/
                        get_trails()
                      }, label: {
                          Text("LOGIN")
                              .foregroundColor(Color.white)
                              .font(Font.custom("Fredoka-Bold", size: 40))
                              .frame(width: 122, height: 40, alignment: .topLeading)
                              .background(
                                  Rectangle()
                                      .fill(Color(red: 0.74, green: 0.39, blue: 0.22))
                                      .cornerRadius(50)
                                      .frame(width: 305, height: 72)
                              )
                      }).padding([.top], 15)
                
                ZStack {
                    Text("greentr        l ")
                        .font(
                            Font.custom("Fredoka-SemiBold", size: 20)
                        )
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(red: 0.74, green: 0.39, blue: 0.22))
                    Image("APP BRAND")
                        .offset(CGSize(width: 30, height: -3))
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
