//
//  RegistrationViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/8/24.
//

import Foundation

class RegistrationViewModel: ObservableObject
{
    @Published  var    email = ""
    @Published  var password = ""
    @Published  var fullname = ""
    @Published  var username = ""
    
    @MainActor
    func createUser() async throws
    {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            fullname: fullname,
            username: username
        )
    } // end func create user
}// end class registration view model
