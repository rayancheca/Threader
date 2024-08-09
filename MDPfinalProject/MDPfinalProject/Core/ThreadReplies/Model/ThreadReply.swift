//
//  ThreadReply.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/6/24.
//

import Firebase
import FirebaseFirestoreSwift

struct ThreadReply: Codable, Identifiable 
{
    @DocumentID var replyId: String?
    let threadId: String
    let replyText: String
    let threadOwnerUid: String
    let threadReplyOwnerUid: String
    let timestamp: Timestamp 
    
    var thread: Thread?
    var replyUser: User?
    
    var id: String {
        return replyId ?? NSUUID().uuidString
    } // end var id
} //  end struct
