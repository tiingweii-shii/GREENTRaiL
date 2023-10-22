//
//  GREENTRaiLApp.swift
//  GREENTRaiL
//
//  Created by Tingwei Shi on 10/21/23.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore

struct user: Codable {
    var age: Int
    var gender: String
    var height: Float
    var weight: Float
    var firstName: String
    var lastName: String
    var aerobicfitnessrating: Int
    var hikes: [String]
    var location: [Float]
}

struct trails: Codable {
    var active: Bool = false
    var difficulty: Int = 3
    var location: [Float] = [3.0]
    var hikes: [String] = ["hi"]
    var name: String
}

struct hikes: Codable {
    var bpm: [Int]
    var distance: [Float]
    var duration: Int
    var elevation: [Float]
    var name: String
    var time: [Float]
    var trail: String
}

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

/*func get_trails() -> trails {
    let docRef = Firestore.firestore().document("trails/Apple Loop")

    var myData = trails()
    docRef.getDocument { (document, error) in
        if let error = error {
            print("Error fetching document: \(error)")
        } else if let document = document, document.exists {
            if let data = document.data() {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    myData = try JSONDecoder().decode(trails.self, from: jsonData)
                    print(myData)
                    // Access other fields here
                } catch {
                    print("Error decoding data: \(error)")
                }
            } else {
                print("Data is not a valid JSON object")
            }
        } else {
            print("Document does not exist")
        }
    }
    return myData
}*/


func get_trails() -> [trails] {
    let collectionRef = Firestore.firestore().collection("trails")

    var myDataArray: [trails] = []
    
    collectionRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching collection: \(error)")
        } else {
            for document in querySnapshot!.documents {
                let data = document.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let myData = try JSONDecoder().decode(trails.self, from: jsonData)
                    myDataArray.append(myData)
                } catch {
                    print("Error decoding data: \(error)")
                }
            }

            // Now you have an array of MyData objects containing data from the collection
            for data in myDataArray {
                print(data)
                // Access other fields here
            }
        }
    }
    return myDataArray
}

func get_users() -> [user] {
    let collectionRef = Firestore.firestore().collection("users")

    var myDataArray: [user] = []
    
    collectionRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching collection: \(error)")
        } else {
            for document in querySnapshot!.documents {
                let data = document.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let myData = try JSONDecoder().decode(user.self, from: jsonData)
                    myDataArray.append(myData)
                } catch {
                    print("Error decoding data: \(error)")
                }
            }

            // Now you have an array of MyData objects containing data from the collection
            for data in myDataArray {
                print(data)
                // Access other fields here
            }
        }
    }
    return myDataArray
}

func get_hikes() -> [hikes] {
    let collectionRef = Firestore.firestore().collection("hikes")

    var myDataArray: [hikes] = []
    
    collectionRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching collection: \(error)")
        } else {
            for document in querySnapshot!.documents {
                let data = document.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let myData = try JSONDecoder().decode(hikes.self, from: jsonData)
                    myDataArray.append(myData)
                } catch {
                    print("Error decoding data: \(error)")
                }
            }

            // Now you have an array of MyData objects containing data from the collection
            for data in myDataArray {
                print(data)
                // Access other fields here
            }
        }
    }
    return myDataArray
}
