//
//  AuthenticationView.swift
//  GREENTRaiL
//
//  Created by Ruth Lu on 1/3/24.
//

import SwiftUI

struct AuthenticationView: View {
    @StateObject var appController:AppController

    var body: some View {
        if appController.isAuthenticated {
            MainMenuView().environmentObject(AppController())
        } else {
            LogInView().environmentObject(AppController())
        }
    }
}
