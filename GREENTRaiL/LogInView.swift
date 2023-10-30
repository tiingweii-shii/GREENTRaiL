//
//  ContentView.swift
//  APP_GREENTRaiL
//
// Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import TerraiOS

struct LogInView: View {
    
    var widgetHandler = WidgetHandler()
    @State private var loggedIn = false
        
    static public var terraManager: TerraManager? = nil
    
    @State var path: [String] = []
    
    public static var userId: String? = nil
    public static var resource: String? = nil
    
    init() {
        Terra.instance(devId: DEVID, referenceId: "TonyStarks") { manager, error in
            LogInView.terraManager = manager
            if let error = error{
                print(error)
            }
        }
    }
    
    let gradientColor = LinearGradient(
        stops: [
            Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1), location: 0.00),
            Gradient.Stop(color: Color(red: 0.59, green: 0.88, blue: 1).opacity(0), location: 1.00),
        ],
        startPoint: UnitPoint(x: 0.5, y: 0.27),
        endPoint: UnitPoint(x: 0.5, y: 0.45)
    )
    let brown = Color(red: 0.74, green: 0.39, blue: 0.22)
        
    var body: some View {
        NavigationView {
            ZStack {
                Image("background_vector_white")
                VStack {
                    Image("home_logo")
                        .padding([.top], 200)
                    loginButton
                    textLogo
                    exploreSlogan
                }
                navigation
            }
            .padding()
            .frame(width: 390, height: 844)
            .background(gradientColor)
        }
    }
    
    var loginButton: some View {
        Button(action: {
            widgetHandler.displayWidget { success, _userId, _resource  in
                if success {
                    LogInView.userId = _userId
                    LogInView.resource = _resource
                    
                    getUsers(name:LogInView.userId!) { user in
                        print(user)
                    }
                    
                    loggedIn = true
                    print(loggedIn)
                }
            }
        }, label: {
            loginButtonLabel
        }).padding([.top], 15)
    }
    
    var loginButtonLabel: some View {
        Text("LOGIN")
            .foregroundColor(Color.white)
            .font(Font.custom("Fredoka-Bold", size: 40))
            .frame(width: 122, height: 40, alignment: .topLeading)
            .background(
                Rectangle()
                    .fill(brown)
                    .cornerRadius(50)
                    .frame(width: 305, height: 72)
            )
    }
    
    var textLogo: some View {
        ZStack {
            Text("greentr        l ")
                .font(
                    Font.custom("Fredoka-SemiBold", size: 20)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(brown)
            Image("app_brand")
                .offset(CGSize(width: 30, height: -3))
        }
        .padding([.top], 200)
    }
    
    var exploreSlogan: some View {
        Text("let’s explore together! ")
            .font(
                Font.custom("Fredoka-Light", size: 13)
            )
            .foregroundColor(brown)
    }
    
    var navigation: some View {
        NavigationLink(destination: MainMenuView(), isActive: $loggedIn) {
            EmptyView() // This view will remain empty
        }.isDetailLink(false)
    }
}

#Preview {
    LogInView()
}
