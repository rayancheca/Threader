//
//  ThreadDetailsView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/7/24.
//

import SwiftUI

struct ThreadDetailsView: View 
{
    let thread: Thread
    @StateObject var viewModel: ThreadDetailsViewModel
    
    init(thread: Thread)
    {
        self.thread = thread
        self._viewModel = StateObject(wrappedValue: ThreadDetailsViewModel(thread: thread))
    } // end init
    
    var body: some View
    {
        ScrollView
        {
            VStack
            {
                HStack
                {
                    CircularProfileImageView(user: thread.user, size: .small)
                    
                    Text(thread.user?.username ?? "")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Text(thread.timestamp.timestampString())
                        .font(.caption)
                        .foregroundStyle(Color(.systemGray3))
                    
                    Button{
                        
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundStyle(Color(.darkGray))
                    } // end button 
                    
                } // end hstack
                
                VStack(alignment: .leading, spacing: 12)
                {
                    Text(thread.caption)
                        .font(.subheadline)
                    
                    ContentActionButtonsView(thread: thread)
                    
                } // end vstack
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                    .padding(.vertical)
                
                LazyVStack
                {
                    ForEach(viewModel.replies) { reply in
                        ThreadReplyCell(reply: reply)
                    } // end for loop
                } // end lazy vstack
  
            } // end vstack
        } // end scrollview
        .padding()
        .navigationTitle("Thread")
        .navigationBarTitleDisplayMode(.inline)
    } // end body
} // end struct

struct ThreadDetailsView_Previews: PreviewProvider {
    static var previews: some View{
        ThreadDetailsView(thread: dev.thread)
    }
}
