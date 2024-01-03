import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AppController: ObservableObject {

    // Reference to the Firestore database
    var db = Firestore.firestore()
    
    @Published var currentUser: user? = nil
    @Published var isAuthenticated = false
    @Published var loginError: String? = nil
    
    // Function to fetch user details
        private func fetchUserDetails(userID: String, completion: @escaping (Result<Bool, Error>) -> Void) {
            let userRef = db.collection("users").document(userID)
            userRef.getDocument { [weak self] document, error in
                if let document = document, document.exists {
                    do {
                        let jsonData = try JSONSerialization.data(withJSONObject: document.data() ?? [:], options: [])
                        let userDetails = try JSONDecoder().decode(user.self, from: jsonData)
                        DispatchQueue.main.async {
                            self?.currentUser = userDetails // Update the published currentUser variable
                            self?.isAuthenticated = true
                        }
                        completion(.success(true))
                    } catch let error {
                        completion(.failure(error))
                    }
                } else {
                    completion(.failure(NSError(domain: "FetchError", code: -2, userInfo: [NSLocalizedDescriptionKey: "User does not exist"])))
                }
            }
        }
    
    /*func new_hike(act:workout, trail: String){
        let collectionRef = Firestore.firestore().collection("hikes")
        
        var newHike = hike(bpm: [act.max_bpm], distance: [0], duration: 0, elevation: [0], name: LogInView.userId!, time: [0], trail: trail)
        
        do {
            let data = try JSONEncoder().encode(newHike)
            if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                // You now have your struct data as a dictionary
                print(dictionary)
                
                // Proceed to write this dictionary to Firestore
                collectionRef.addDocument(data: dictionary)
                update_difficulty(trail: trail)
            }
        } catch {
            print("Error converting struct to dictionary: \(error)")
        }
    }*/
    
    func update_difficulty(trail: String){
        var sum = 0
        var num = 0
        
        getHikes(name: trail) { hikes in
            for hike in hikes {
                print(hike)
                // Access other fields here
                sum += hike.bpm.max()!-45
                num += 1
            }
            
            let docRef = Firestore.firestore().collection("trails").document(trail)
            docRef.updateData(["difficulty": (min(10, sum/max(num, 1)/10))])
        }
    }
    
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
    
    // Function to add a new hike
    func addHike(userID: String, newHike: hike, trailName: String) {
        // Update the user's hike list
        let userRef = db.collection("users").document(userID)
        userRef.updateData([
            "hikes": FieldValue.arrayUnion([newHike.name])
        ])
        
        // Update the trail's hike list
        let trailRef = db.collection("trails").document(trailName)
        trailRef.updateData([
            "hikes": FieldValue.arrayUnion([newHike.name])
        ])
        
        // Add the new hike to the hikes collection
        db.collection("hikes").document(newHike.name).setData([
            "bpm": newHike.bpm,
            "distance": newHike.distance,
            "duration": newHike.duration,
            "elevation": newHike.elevation,
            "name": newHike.name,
            "time": newHike.time,
            "trail": newHike.trail
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    // Function to log in the user
    func login(email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let userID = authResult?.user.uid else {
                    completion(.failure(NSError(domain: "LoginError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error occurred"])))
                    return
                }
                
                // Fetch user details from Firestore after successful login
                self?.fetchUserDetails(userID: userID, completion: completion)
            }
        }
        
        // Function to log out the user
        func logout(completion: @escaping (Result<Bool, Error>) -> Void) {
            do {
                try Auth.auth().signOut()
                completion(.success(true))
            } catch let signOutError as NSError {
                completion(.failure(signOutError))
            }
        }
    
    // Function to register a new user
    func registerUser(firstName: String, lastName: String, email: String, password: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        // Register the user with Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let userID = authResult?.user.uid else {
                completion(.failure(NSError(domain: "RegistrationError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to retrieve user ID"])))
                return
            }
            
            // User is successfully registered, now add a document for the user in Firestore
            let newUser = user(age: 1, gender: "", height: 1, weight: 1, firstName: firstName, lastName: lastName, email: email, aerobicfitnessrating: 1, hikes: [""], location: [1])
            
            self?.db.collection("users").document(userID).setData([
                "firstName": firstName,
                "lastName": lastName,
                "email": email,
                "gender": newUser.gender,
                "height": newUser.height,
                "weight": newUser.weight,
                "age": newUser.age,
                "aerobicfitnessrating": newUser.aerobicfitnessrating,
                "hikes": newUser.hikes,
                "location": newUser.location
            ]) { err in
                if let err = err {
                    completion(.failure(err))
                } else {
                    DispatchQueue.main.async {
                        self?.currentUser = newUser // Update the current user
                        completion(.success(true))
                    }
                }
            }
        }
    }

    
    
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
                        completion(myData)
                    } catch {
                        print("Error decoding data: \(error)")
                    }
                } else {
                    print("Data is not a valid JSON object")
                }
            } else {
                
                let h1 = user(age: 23, gender: "female", height: 5.5, weight:155.6, firstName: "Rey", lastName: "Shields", email: "k@k.com", aerobicfitnessrating: 4, hikes: ["1", "2"], location: [34, 54] )
                do {
                    let data = try JSONEncoder().encode(h1)
                    if let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] {
                        // You now have your struct data as a dictionary
                        print(dictionary)
                        
                        // Proceed to write this dictionary to Firestore
                        collectionRef.setData(dictionary)
                        completion(h1)
                    }
                    
                } catch {
                    print("Error converting struct to dictionary: \(error)")
                }
                
            }
        }
    }

    func requestActivity(startDate: Date, endDate: Date, resource: String, completion:@escaping(workout)->Void){
        
        /*let client = TerraClient(userId: currentUser.userId!, devId: DEVID, xAPIKey: XAPIKEY)
        
        var rec = workout(max_bpm: 0, startTime: "", endTime: "")
        
        let formatter = ISO8601DateFormatter()
        
        if (resource == "APPLE"){
            LogInView.terraManager?.getActivity(type: .APPLE_HEALTH, startDate: startDate, endDate: endDate, toWebhook: false){success,data,error in
                let lastActivity = data?.data?.last
                rec.max_bpm = Int((lastActivity?.heart_rate_data?.summary?.max_hr_bpm)!)
                rec.startTime = (lastActivity?.metadata?.start_time)!
                rec.endTime =  (lastActivity?.metadata?.end_time)!
                completion(rec)
                
            }
        }
        else{
            client.getActivity(startDate: startDate, endDate: endDate, toWebhook: false) { data in
                let lastActivity = (data?.data?.last)
                rec.max_bpm = Int((lastActivity?.heart_rate_data?.summary?.max_hr_bpm)!)
                rec.startTime = (lastActivity?.metadata?.start_time)!
                rec.endTime =  (lastActivity?.metadata?.end_time)!
                completion(rec)
            }
        }*/
    }
}
