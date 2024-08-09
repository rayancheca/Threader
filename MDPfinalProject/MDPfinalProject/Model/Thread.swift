//
//  Thread.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable, Hashable
{
    @DocumentID var threadId: String?
    
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    var replyCount: Int 
    
    var didLike: Bool? = false
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }

    var user: User?
    
    
} // end struct



