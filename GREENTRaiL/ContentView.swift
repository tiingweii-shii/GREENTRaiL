//
//  ContentView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import TerraiOS

struct ContentView: View {
    
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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
