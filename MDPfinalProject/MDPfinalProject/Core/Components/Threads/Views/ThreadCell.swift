//
//  ThreadCell.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct ThreadCell: View 
{
    let thread: Thread
    
    var body: some View
    {
        VStack
        {
            HStack(alignment: .top, spacing: 12)
            {
                CircularProfileImageView(user: thread.user, size: .small)
                VStack(alignment: .leading, spacing: 4)
                {
                    HStack 
                    {
                        Text(thread.user?.username ?? "")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Text(thread.timestamp.timestampString())
                            .font(.caption)
                            .foregroundColor(Color(.systemGray3))
                        
                        Button{
                            
                        }label: {
                            Image(systemName: "ellipsis")
                                .foregroundColor(Color(.darkGray))
                        } // end button
                        
                       
                    } // end hstack
                    
                    Text(thread.caption)
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    ContentActionButtonsView(thread: thread)
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                } // end vstack
                
            } // end hstack
            
            Divider()
        } // end vstack
        .padding()
    } // end body
} // end struct

struct ThreadCell_Previews: PreviewProvider {
    static var previews: some View{
        ThreadCell(thread: dev.thread)
    }
}
