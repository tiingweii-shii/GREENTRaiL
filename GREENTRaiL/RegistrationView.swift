import SwiftUI

struct RegistrationView: View {
    @ObservedObject var appController = AppController()
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var loggedIn = false

    var body: some View {
        VStack {
            TextField("First Name", text: $firstName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Last Name", text: $lastName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Register") {
                // Ensure passwords match before attempting to register
                guard password == confirmPassword else {
                    print("Passwords do not match!")
                    // Ideally, update the UI to indicate the error
                    return
                }

                // Proceed with registration
                appController.registerUser(firstName: firstName, lastName: lastName, email: email, password: password) { result in
                    DispatchQueue.main.async {
                        switch result {
                        case .success(_):
                            loggedIn = true
                            print("Registration Successful!")
                            // Update UI or navigate upon successful registration
                        case .failure(let error):
                            print("Registration failed with error: \(error.localizedDescription)")
                            // Handle error or update UI
                        }
                    }
                }
            }
            navigation
        }
        .padding()
    }
    
    var navigation: some View {
        NavigationLink(destination: MainMenuView().environmentObject(appController), isActive: $loggedIn) {
            EmptyView() // This view will remain empty
        }.isDetailLink(false)
    }
}
