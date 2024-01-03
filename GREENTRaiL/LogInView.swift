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
    @State private var email: String = ""
    @State private var password: String = ""
        
    static public var terraManager: TerraManager? = nil
    
    @State private var navigateToMain = false
    
    // @State var path: [String] = []
    
    // public static var userId: String? = nil
    // public static var resource: String? = nil
    @EnvironmentObject var appController: AppController // UserController injected as an environment object
    
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
                    
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .cornerRadius(50)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                        .cornerRadius(50)
                    loginButton
                    registerButton
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
            // Action for the login button
            appController.login(email: email, password: password) { result in
                DispatchQueue.main.async {
                    switch result {
                        case .success(_):
                            loggedIn = true
                            print("Login Successful!")
                            print(appController.isAuthenticated)
                        case .failure(let error):
                            print("Login failed with error: \(error.localizedDescription)")
                            // Handle error or update UI
                        }
                    }
                }
            }
               , label: {
            loginButtonLabel
        }).padding([.top], 15)
    }
    
    var registerButton: some View {
        NavigationLink(destination: {RegistrationView().environmentObject(appController)}, label: {
            registerButtonLabel
        }).padding([.top], 40)
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
    
    var registerButtonLabel: some View {
        Text("REGISTER")
            .foregroundColor(Color.white)
            .font(Font.custom("Fredoka-Bold", size: 40))
            .frame(width: 185, height: 40, alignment: .topLeading)
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
        NavigationLink(destination: MainMenuView().environmentObject(appController), isActive: $loggedIn) {
            EmptyView() // This view will remain empty
        }.isDetailLink(false)
    }
}

#Preview {
    LogInView().environmentObject(AppController())
}
