//
//  MainView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import TerraiOS

struct MainView: View {
    
    var widgetHandler = WidgetHandler()
    
    static public var terraManager: TerraManager? = nil
    
    @State var path: [String] = []
    
    public static var userId: String? = nil
    public static var resource: String? = nil
    
    init() {
        Terra.instance(devId: DEVID, referenceId: "TonyStarks") { manager, error in
            ContentView.terraManager = manager
            if let error = error{
                print(error)
            }
        }
    }
    
    
    var body: some View {
        TabView{
            MapHomeView()
                .tabItem { Label("Map", image: "map_nav") }
            
            LogInView()
                .tabItem { Label("Activity", image:"activity_nav")}
                    
            ContentView()
                .tabItem { Label("Profile", image:"profile_nav")}
        }
        .onAppear() {
                    UITabBar.appearance().backgroundColor = UIColor(Color(red: 0.13, green: 0.32, blue: 0.41))
                }
        
    }
}

#Preview {
    MainView()
}
