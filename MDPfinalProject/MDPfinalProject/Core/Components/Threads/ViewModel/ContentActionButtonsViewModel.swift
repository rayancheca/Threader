//
//  ContentActionButtonsViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/5/24.
//

import Foundation

@MainActor
class ContentActionButtonsViewModel: ObservableObject {
    @Published var thread: Thread
    
    init(thread: Thread) {
        self.thread = thread
        Task{ try await checkIfUserLikedThread() }
    } // end init
    
    func likeThread() async throws {    
        try await ThreadService.likeThread(thread)
        self.thread.didLike = true
        self.thread.likes += 1
    }
    
    func unlikeThread() async throws {
        try await ThreadService.unlikeThread(thread)
        self.thread.didLike = false
        self.thread.likes -= 1
    }
    
    func checkIfUserLikedThread() async throws {
        let didLike = try await ThreadService.checkIfUserLikedThread(thread)
        
        // only execute update if thread has been liked
        if didLike{
            self.thread.didLike = true
        }
    }
}

