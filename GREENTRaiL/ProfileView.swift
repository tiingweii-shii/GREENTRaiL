//
//  ProfileView.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI

struct profileInfo {
    var userId: String
    var name: String
    var age: String
    var height: String
    var weight: String
}

var profile = profileInfo(userId: "12345", name: "Greeny", age: "10", height: "5'9\"", weight: "140 lb")

struct ProfileView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 400, height: 830)
                    .background(Color(red: 0.13, green: 0.32, blue: 0.41))
                    .padding([.top], 20)
                    .cornerRadius(56)
                ScrollView {
                    LazyVStack(alignment: .leading, spacing: 16) {
                        Divider()
                            .frame(height: 10)
                            .overlay(.white)
                            .padding([.top, .bottom], 10)
                        Text("Profile")
                            .font(
                                Font.custom("Fredoka", size: 32)
                                    .weight(.bold)
                            )
                            .frame(width: 105, height: 33, alignment: .topLeading)
                        VStack(spacing: 5) {
                            HStack {
                                Text("UserID:")
                                Text(profile.userId)
                            }
                            HStack {
                                Text("Name:")
                                Text(profile.name)
                            }
                            HStack {
                                Text("Age:")
                                Text(profile.age)
                            }
                            HStack {
                                Text("Height:")
                                Text(profile.height)
                            }
                            HStack {
                                Text("Weight:")
                                Text(profile.height)
                            }
                        }
                        .font(
                            Font.custom("Fredoka", size: 24)
                                .weight(.medium)
                        )
                    }
                    Divider()
                        .frame(height: 10)
                        .overlay(.white)
                        .padding([.top, .bottom], 10)
                    
                    LazyVStack(alignment: .leading, spacing: 18) {
                        Text("Statistics")
                            .font(
                                Font.custom("Fredoka", size: 32)
                                    .weight(.bold)
                            )
                            .frame(width: 150, height: 33, alignment: .topLeading)
                        VStack(spacing: 5) {
                            VStack {
                                Text("Average heart rate:")
                                VStack {
                                    HStack {
                                        Text("this week:")
                                        Text("70 per minute")
                                    }
                                    HStack {
                                        Text("this month:")
                                        Text("79 per minute")
                                    }
                                }.font(
                                    Font.custom("Fredoka", size: 24)
                                        .weight(.light)
                                )
                            }
                        }
                        .font(
                            Font.custom("Fredoka", size: 24)
                                .weight(.medium)
                        )
                        
                        Divider()
                            .frame(height: 10)
                            .overlay(.white)
                            .padding([.top, .bottom], 10)
                    }
                    
                    Button(action: {
                    }, label: {
                        Text("Settings")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Fredoka-Bold", size: 32))
                            .frame(width: 122, height: 40, alignment: .topLeading)
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.white, lineWidth: 5)
                                    .frame(width: 350, height: 60)
                            )
                    }).padding(20)
                    
                    NavigationLink(destination: LogInView()) {
                        Text("Log Out")
                            .foregroundColor(Color.white)
                            .font(Font.custom("Fredoka-Bold", size: 32))
                            .frame(width: 122, height: 40, alignment: .topLeading)
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(.white, lineWidth: 5)
                                    .frame(width: 350, height: 60)
                            )
                    }.padding(20)
                    
                }
                .padding(.top, 80)
                .padding(.leading, 15)
                .frame(width: 400, height: 850)
                .foregroundColor(.white)
            }
            .frame(width: 400, height: 850)
            .background(Color(red: 0.71, green: 0.91, blue: 1))
        }
    }
}

struct SectionCardView: View {

    let info: [String]
    let padding: CGFloat = 10

    var body: some View {
        Text("Profile")
            .font(
                Font.custom("Fredoka", size: 32)
                    .weight(.bold)
            )
            .foregroundColor(.white)
            .frame(width: 105, height: 33, alignment: .topLeading)

    }
}

#Preview {
    ProfileView()
}
