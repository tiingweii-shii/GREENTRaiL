//
//  MainView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            MapHomeView()
                .tabItem { Label("Map", systemImage: "list.dash") }
            
            LogInView()
                    .tabItem { Label("Activity", systemImage: "square.and.pencil") }
        }
        
    }
}

#Preview {
    MainView()
}
