//
//  GREENTRaiLApp.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import TerraiOS

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
            AuthenticationView(appController:AppController())
        }
    }
}

/* func add_hikes(){
    var h1 = hikes(bpm: [80, 100, 120, 130], distance: [10, 20, 30, 40], duration: 30, elevation: [1, 2, 3, 4], name: "Joe Mama", time: [5, 10, 15, 20], trail: "Apple Loop")
    var h2 = hikes(bpm: [80, 100, 120, 130], distance: [10, 20, 30, 40], duration: 30, elevation: [1, 2, 3, 4], name: "Quack quack", time: [5, 10, 15, 20], trail: "Lighttime Trek")
    var h3 = hikes(bpm: [50, 60, 60, 70], distance: [1, 2, 3, 4], duration: 5, elevation: [3, 4, 5, 6], name: "xyz", time: [3, 4, 5, 6], trail: "Cape Penguin Climb")
    
    let collectionRef = Firestore.firestore().collection("hikes")
    
    do {
        let data = try JSONEncoder().encode(h1)
        if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            // You now have your struct data as a dictionary
            print(dictionary)
            
            // Proceed to write this dictionary to Firestore
            collectionRef.addDocument(data: dictionary)
        }
    } catch {
        print("Error converting struct to dictionary: \(error)")
    }
    do {
        let data = try JSONEncoder().encode(h2)
        if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            // You now have your struct data as a dictionary
            print(dictionary)
            
            // Proceed to write this dictionary to Firestore
            collectionRef.addDocument(data: dictionary)
        }
    } catch {
        print("Error converting struct to dictionary: \(error)")
    }
    do {
        let data = try JSONEncoder().encode(h3)
        if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
            // You now have your struct data as a dictionary
            print(dictionary)
            
            // Proceed to write this dictionary to Firestore
            collectionRef.addDocument(data: dictionary)
        }
    } catch {
        print("Error converting struct to dictionary: \(error)")
    }
}
*/

