//
//  PreviewProvider.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import SwiftUI
import Firebase

extension PreviewProvider 
{
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
} // end extension preview porivder

class DeveloperPreview
{
    static let shared  = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Rayan Checa", email: "rkc@gmail.com", username: "rayan_checa")

    lazy var thread = Thread(
        ownerUid: "123",
        caption: "This is a test thread",
        timestamp: Timestamp(),
        likes: 37,
        replyCount: 5,
        user: user
    )
    
    lazy var reply = ThreadReply(
        threadId: "123",
        replyText: "This is a preview reply",
        threadOwnerUid: "123",
        threadReplyOwnerUid: "123",
        timestamp: Timestamp(),
        thread: thread,
        replyUser: user
    )
} // end class developer preview
