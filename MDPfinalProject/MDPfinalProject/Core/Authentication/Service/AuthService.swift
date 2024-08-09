//
//  AuthService.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/8/24.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService
{
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init(){
        self.userSession = Auth.auth().currentUser
    }
    @MainActor
    func login(
        withEmail email : String,
        password: String
    ) async throws
    {
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        } // end do catch
    } // end func login
    
    @MainActor
    func createUser(withEmail email : String,
                    password: String,
                    fullname: String,
                    username: String
    ) async throws
    {
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, fullname: fullname, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        } // end do catch
    } // end func create user
    
    
    func signOut()
    {
        try? Auth.auth().signOut() // sign out on backend
        self.userSession = nil     // removes session locally and updates routing
        UserService.shared.reset() // sets current user object to nil
    } // end signout func
    
    @MainActor
    private func uploadUserData(
        withEmail email : String,
        fullname: String,
        username: String,
        id: String
    ) async throws
    {
      let user = User(id: id, fullname: fullname, email: email, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    } // end func upload user data
} // end class auth service
