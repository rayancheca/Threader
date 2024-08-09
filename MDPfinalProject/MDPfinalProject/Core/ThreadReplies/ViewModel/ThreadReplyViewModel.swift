//
//  ThreadReplyViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/6/24.
//

import Firebase
import FirebaseFirestoreSwift

class ThreadReplyViewModel: ObservableObject
{
    func uploadThreadReply(replyText: String, thread: Thread) async throws 
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let reply = ThreadReply(threadId: thread.id,
                                replyText: replyText,
                                threadOwnerUid: uid,
                                threadReplyOwnerUid: thread.ownerUid,
                                timestamp: Timestamp()
        )
        try await ThreadReplyService.uploadThreadReply(reply, toThread: thread)
    }
}
