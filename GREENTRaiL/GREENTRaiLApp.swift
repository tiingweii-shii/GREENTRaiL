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
    var age: Int = 1
    var gender: String = ""
    var height: Float = 1
    var weight: Float = 1
    var firstName: String = ""
    var lastName: String = ""
    var aerobicfitnessrating: Int = 1
    var hikes: [String] = [""]
    var location: [Float] = [1]
}

struct trails: Codable {
    var active: Bool = false
    var difficulty: Int = 3
    var location: [Float] = [3.0]
    var hikes: [String] = ["hi"]
    var name: String
}

struct hike: Codable {
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


func getTrails(completion: @escaping ([trails]) -> Void) {
    let collectionRef = Firestore.firestore().collection("trails")

    var myDataArray: [trails] = []
    
    collectionRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching collection: \(error)")
            completion([])
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
            completion(myDataArray)
        }
    }
}

/*
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
}*/

func getUsers(name: String, completion: @escaping (user) -> Void) {
    let collectionRef = Firestore.firestore().collection("users").document(name)

    var myData = user()
    
    collectionRef.getDocument { (document, error) in
        if let error = error {
            print("Error fetching document: \(error)")
        } else if let document = document, document.exists {
            if let data = document.data() {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    myData = try JSONDecoder().decode(user.self, from: jsonData)
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
}

/* func get_hikes(name: String) -> [hikes] {
    let collectionRef = Firestore.firestore().collection("hikes").whereField("trail", isEqualTo: name)

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

            for data in myDataArray {
                // print(data)
                // Access other fields here
            }
        }
    }
    // Now you have an array of MyData objects containing data from the collection
    for data in myDataArray {
        print(data)
        // Access other fields here
    }
    return myDataArray
}*/

func getHikes(name: String, completion: @escaping ([hike]) -> Void) {
    let collectionRef = Firestore.firestore().collection("hikes").whereField("trail", isEqualTo: name)

    var myDataArray: [hike] = []
    
    collectionRef.getDocuments { (querySnapshot, error) in
        if let error = error {
            print("Error fetching collection: \(error)")
            completion([])
        } else {
            for document in querySnapshot!.documents {
                let data = document.data()
                
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data, options: [])
                    let myData = try JSONDecoder().decode(hike.self, from: jsonData)
                    myDataArray.append(myData)
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
            completion(myDataArray)
        }
    }
}

func update_difficulty(trail: String){
    var sum = 0
    var num = 0
    
    getHikes(name: trail) { hikes in
        for hike in hikes {
            print(hike)
            // Access other fields here
            sum += hike.bpm.max()!
            num += 1
        }
        
        let docRef = Firestore.firestore().collection("trails").document(trail)
        docRef.updateData(["difficulty": (sum/max(num, 1))])
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
