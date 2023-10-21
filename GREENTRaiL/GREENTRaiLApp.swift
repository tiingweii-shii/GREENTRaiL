//
//  GREENTRaiLApp.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    let db = Firestore.firestore()
    return true
  }
}

@main
struct GREENTRaiLApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            LogInView()
        }
    }
}

func get_trails() {
    let db = Firestore.firestore()
    db.collection("trails").whereField("active", isEqualTo: true)
        .getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
}
