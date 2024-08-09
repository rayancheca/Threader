//
//  ThreadReplyView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/5/24.
//

import SwiftUI

struct ThreadReplyView: View 
{
    let thread: Thread
    @State private var replyText = ""
    @State private var threadViewHeight: CGFloat = 24
    @StateObject var viewModel = ThreadReplyViewModel()
    @Environment(\.dismiss) var dismiss
    
    private var currentUser: User?{
        return UserService.shared.currentUser
    }
    
    func setThreadViewHeight()
    {
        let imageDimension: CGFloat = ProfileImageSize.small.dimension
        let padding: CGFloat = 16
        let width = UIScreen.main.bounds.width - imageDimension - padding
        let font = UIFont.systemFont(ofSize: 12)
        
        let captionSize = thread.caption.heightWithConstrainedWidth(width, font: font)
        
        threadViewHeight = captionSize + imageDimension - 16
    }
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                Divider()
                
                VStack(alignment: .leading, spacing: 12)
                {
                    HStack(alignment: .top)
                    {
                        VStack
                        {
                            CircularProfileImageView(user: thread.user, size: .small)
                            
                            Rectangle()
                                .frame(width: 2, height: threadViewHeight)
                                .foregroundStyle(Color(.systemGray4))
                        } // end vstack
                        
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text(thread.user?.username ?? "" )
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                                .multilineTextAlignment(.leading)
                        } // end vstack
                        .font(.footnote)
                        
                        Spacer()
                        
                    } // end hstack
                    
                    HStack(alignment: .top)
                    {
                        CircularProfileImageView(user: currentUser, size: .small)
                        
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text(currentUser?.username ?? "")
                            
                            TextField("Add your reply...", text: $replyText, axis: .vertical)
                                .multilineTextAlignment(.leading)
                        } // end vstack
                        .font(.footnote)
                    } // end hstack
                    
                }// end vstack
                .padding()

                Spacer()
            } // end vstack
            .onAppear { setThreadViewHeight() }
            .navigationTitle("Reply")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                ToolbarItem(placement: .topBarLeading)
                {
                    Button("Cancel"){
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                } // end toolbaritem 2
                
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button("Post"){
                        Task
                        {
                            try await viewModel.uploadThreadReply(replyText: replyText, thread: thread)
                            dismiss()
                        }
                    }
                    .opacity(replyText.isEmpty ? 0.5 : 1.0)
                    .disabled(replyText.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                } // end toolbaritem 2
            } // end toolbar
        } // end navigationstack
    } // end body
} // end struct

struct ThreadReplyView_Previews: PreviewProvider{
    static var previews: some View{
        ThreadReplyView(thread: dev.thread)
    }
}
