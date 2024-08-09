//
//  LoginViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import Foundation

class LoginViewModel: ObservableObject
{
    @Published  var    email = ""
    @Published  var password = ""
    
    
    @MainActor
    func login() async throws
    {
        try await AuthService.shared.login(withEmail: email, password: password)
    } // end func create user
}// end class registration view model

