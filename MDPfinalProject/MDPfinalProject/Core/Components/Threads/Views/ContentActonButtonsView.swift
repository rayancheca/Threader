//
//  ContentActonButtonsView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/5/24.
//

import SwiftUI

struct ContentActionButtonsView: View
{
    @ObservedObject var viewModel: ContentActionButtonsViewModel
    @State private var showReplySheet = false
    
    init(thread: Thread){
        self.viewModel = ContentActionButtonsViewModel(thread: thread)
    }
    
    private var didLike: Bool{
        return viewModel.thread.didLike ?? false
    }
    
    private var thread: Thread {
        return viewModel.thread
    }
    
    private var likesText: String {
            let likesCount = thread.likes
            return "\(likesCount) \(likesCount == 1 ? "like" : "likes")"
        }
    
    private var repliesText: String {
            let replyCount = thread.replyCount
            return "\(replyCount) \(replyCount == 1 ? "reply" : "replies")"
        }
    
    func handleLikeTapped() {
        Task{
            if didLike {
                try await viewModel.unlikeThread()
            } else {
                try await viewModel.likeThread()
            }
        } // end task
    } // end func handleliketapped
    
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            HStack(spacing: 16)
            {
                Button {
                    handleLikeTapped()
                } label: {
                    Image(systemName: didLike ? "heart.fill" : "heart")
                        .foregroundStyle(didLike ? .red : .black)
                    
                } // end button
                
                Button{
                    showReplySheet.toggle()
                } label: {
                    Image(systemName: "bubble.right")
                } // end button
                
                Button{
                    
                } label: {
                    Image(systemName: "arrow.rectanglepath")
                } // end button
                
                Button{
                    
                } label: {
                    Image(systemName: "paperplane")
                } // end button
                
            }// end hstack
            
            HStack(spacing: 4)
            {
                if thread.replyCount > 0 
                {
                    Text(repliesText)
                } // end if statement
                
                if thread.replyCount > 0 && thread.likes > 0 
                {
                    Text("-")
                } // end if statement
                
                if thread.likes > 0
                {
                    Text(likesText)
                }// end if statement
            } // end hstack
            .font(.caption)
            .foregroundStyle(.gray)
            .padding(.vertical, 4)
        } // end vstack
        .sheet(isPresented: $showReplySheet, content: {
            ThreadReplyView(thread: thread)
        })
    }
}

struct ContentActionButtonsView_Preview: PreviewProvider {
    static var previews: some View {
        ContentActionButtonsView(thread: dev.thread)
    }
}

