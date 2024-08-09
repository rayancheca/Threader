//
//  CreatePostViewModel.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/16/24.
//

import Firebase

class CreatePostViewModel: ObservableObject
{
    func uploadThread(caption: String) async throws
    {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0, replyCount: 0)
        try await ThreadService.uploadThread(thread)
    } // end func upload threads
} // end class create post view model

