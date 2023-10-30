//
//  MainView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import TerraiOS

struct MainMenuView: View {
    
    @State private var selection = 2
    
    var body: some View {
        TabView(selection:$selection){
            ActivityView()
                .tabItem { 
                    Image("activity_nav")
                }
                .tag(1)
            
            MapHomeView()
                .tabItem {
                    Image("map_nav") }
                .tag(2)
                    
            ProfileView()
                .tabItem { Image("profile_nav")}
                .tag(3)
        }
        .onAppear() {
                    UITabBar.appearance()
                .backgroundColor = UIColor(Color(red: 0.13, green: 0.32, blue: 0.41))
                }
        
    }
}

#Preview {
    MainMenuView()
}
