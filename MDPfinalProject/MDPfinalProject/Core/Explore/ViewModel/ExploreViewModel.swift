//
//  ExploreViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import Foundation


class ExploreViewModel: ObservableObject 
{
    @Published var users = [User]()
    
    init() {
        Task { try await fetchUsers() }
    } // end init
    
    @MainActor
    private func fetchUsers() async throws
    {
        self.users = try await UserService.fetchUsers()
    } // end func fetch users
} // end class explore view model
