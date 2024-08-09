//
//  ThreadReplyProfileCell.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/7/24.
//

import SwiftUI

struct ThreadReplyProfileCell: View 
{
    let reply: ThreadReply
    
    var body: some View
    {
        VStack(alignment: .leading)
        {
            if let thread = reply.thread 
            {
                // thread view
                HStack(alignment: .top)
                {
                    VStack
                    {
                        CircularProfileImageView(user: thread.user, size: .small)
                        
                        Rectangle()
                            .frame(width: 2, height: 64)
                            .foregroundStyle(Color(.systemGray4))
                    } // end vstack
                    
                    VStack(alignment: .leading, spacing: 12)
                    {
                        VStack(alignment: .leading, spacing: 4)
                        {
                            Text(thread.user?.username ?? "")
                                .fontWeight(.semibold)
                            
                            Text(thread.caption)
                        } // end vstack
                        .font(.footnote)
                        
                        ContentActionButtonsView(thread: thread)
                    } // end vstack
                    
                    Spacer()
                    
                } // end hstack
            } // end if statement
            
            // reply view
            
            HStack(alignment: .top)
            {
                CircularProfileImageView(user: reply.replyUser, size: .small)
                
                VStack(alignment: .leading, spacing: 4)
                {
                    Text(reply.replyUser?.username ?? "")
                        .fontWeight(.semibold)
                    
                    Text(reply.replyText)
                } // end vstack
                .font(.footnote)
            } // end hstack
            
            Divider()
                .padding(.bottom, 8)
            
        } // end vstack
        .padding(.horizontal)
    } // end body
} // end struct

#Preview {
    ThreadReplyProfileCell(reply: DeveloperPreview.shared.reply)
}
