//
//  ThreadReplyCell.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/7/24.
//

import SwiftUI

struct ThreadReplyCell: View 
{
    let reply: ThreadReply
    
    private var user: User? {
        return reply.replyUser
    }
    var body: some View
    {
        VStack
        {
            HStack(alignment: .top, spacing: 12)
            {
                CircularProfileImageView(user: user, size: .small)
                VStack(alignment: .leading, spacing: 4)
                {
                    HStack
                    {
                        Text(user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(reply.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        } // end button
                        
                       
                    } // end hstack
                    
                    Text(reply.replyText)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    
                } // end vstack
                
            } // end hstack
            
            Divider()
        } // end vstack
        .padding()
    } // end body
} // end struct

struct ThreadReplyCell_Previews: PreviewProvider {
    static var previews: some View {
        ThreadReplyCell(reply: dev.reply)
    }
}
    
