//
//  UserContentListViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation

@MainActor
class UserContentListViewModel: ObservableObject
{
    @Published var threads = [Thread]()
    @Published var replies = [ThreadReply]()

    let user: User
    
    init(user: User){
        self.user = user
        Task { try await fetchUserThreads() }
        Task { try await fetchUserReplies() }
    }
    
    
    func fetchUserThreads() async throws
    {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0 ..< threads.count{
            threads[i].user = self.user
        }
        
        self.threads = threads
    } // end func fetch user threads
    
    func fetchUserReplies() async throws
    {
        self.replies = try await ThreadService.fetchThreadReplies(forUser: user)
        
        try await fetchReplyThreadData()
    } // end func fetchuserreplies
    
    func fetchReplyThreadData() async throws
    {
        for i in 0 ..< replies.count
        {
            let reply = replies[i]
            
            var thread = try await ThreadService.fetchThread(threadId: reply.threadId)
            thread.user = try await UserService.fetchUser(withUid: thread.ownerUid)
            
            replies[i].thread = thread
        }
    } // end func fetchreplythreaddata
    
    
} // end class user content list view model
