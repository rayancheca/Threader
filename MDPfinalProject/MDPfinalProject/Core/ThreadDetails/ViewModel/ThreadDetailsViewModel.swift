//
//  ThreadDetailsViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/7/24.
//

import Foundation

@MainActor
class ThreadDetailsViewModel: ObservableObject
{
    @Published var replies = [ThreadReply]()
    private let thread: Thread
    
    init(thread: Thread){
        self.thread = thread
        Task { try await fetchThreadReplies() }
    } // end init
    

    private func fetchThreadReplies() async throws
    {
        self.replies = try await ThreadReplyService.fetchThreadReplies(forThread: thread)
        try await fetchUserDataForReplies()
    } // end func
    
    private func fetchUserDataForReplies() async throws {
        for i in 0 ..< replies.count {
            let reply = replies[i]
            
            async let user = try await UserService.fetchUser(withUid: reply.threadReplyOwnerUid)
            self.replies[i].replyUser = try await user
        }
    }
    
} // end class
