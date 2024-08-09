//
//  FeedView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct FeedView: View 
{
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            ScrollView(showsIndicators : false)
            {
                LazyVStack
                {
                    ForEach(viewModel.threads) { thread in
                        NavigationLink(value: thread) {
                            ThreadCell(thread: thread)
                        }
                        
                    }
                } // end lazy vstack
            } // end scrollview
            .refreshable{
                Task { try await viewModel.fetchThreads() }
            } // end refreshable
            .navigationDestination(for: Thread.self, destination: { thread in
                ThreadDetailsView(thread: thread)
            })
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        } // end navigationStack
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button{
                    
                } label: {
                    Image(systemName: "arrow.counterclockwise")
                        .foregroundColor(.black)
                } // end button
            } // end tool bar item
        } // end toolbar
    } // end body
} // end struct

#Preview {
    NavigationStack{
        FeedView()
    }
}
