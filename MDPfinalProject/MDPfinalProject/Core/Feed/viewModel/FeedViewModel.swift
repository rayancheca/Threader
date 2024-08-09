//
//  FeedViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation

@MainActor
class FeedViewModel: ObservableObject
{
    @Published var threads = [Thread]()
    
    init(){
        Task { try await fetchThreads()}
    }
    
    func fetchThreads() async throws {
        self.threads = try await ThreadService.fetchThreads()
        try await fetchUserDataForThreads()
    } // end func detch threads
    
    private func fetchUserDataForThreads() async throws
    {
        for i in 0 ..< threads.count
        {
            let thread = threads[i]
            let ownerUid = thread.ownerUid
            let threadUser = try await UserService.fetchUser(withUid: ownerUid)
            
            threads[i].user = threadUser
        } // end for loop
    } // end func fetch user data for threads
} // end class feed view model

