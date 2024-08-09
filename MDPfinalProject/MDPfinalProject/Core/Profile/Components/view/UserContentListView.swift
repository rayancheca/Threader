//
//  UserContentListView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import SwiftUI

struct UserContentListView: View 
{
    @StateObject var viewModel: UserContentListViewModel
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    
    private var filterBarWidth: CGFloat{
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 20
    }
    
    init(user: User){
        self._viewModel = StateObject(wrappedValue: UserContentListViewModel(user: user))
    }
    
    var body: some View 
    {
        VStack
        {
            HStack
            {
                ForEach(ProfileThreadFilter.allCases){ filter in
                    VStack{
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        
                        if selectedFilter == filter
                        {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: filterBarWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                            
                            
                        }else{
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: filterBarWidth, height: 1)
                        }
                        
                    }
                    .onTapGesture {
                        withAnimation(.spring()){
                            selectedFilter = filter
                        }
                    }
                }
            } // end hstack
            
                LazyVStack
                {
                    switch selectedFilter
                    {
                    case .threads:
                        ForEach(viewModel.threads){thread in
                            ThreadCell(thread: thread)
                                .transition(.move(edge: .leading))
                        }
                    case .replies:
                        ForEach(viewModel.replies){reply in
                            ThreadReplyProfileCell(reply: reply)
                                .transition(.move(edge: .trailing))
                        }
                    } // end switch case
                } // end lazyvstack
        } // end vstack
        .padding(.vertical, 8)
        .navigationBarItems(leading: Button(action: {
                    Task {
                        do {
                            try await viewModel.fetchUserThreads()
                            try await viewModel.fetchUserReplies()
                        } catch {
                            print("Failed to refresh: \(error.localizedDescription)")
                        }
                    }
                }) {
                    Image(systemName: "arrow.clockwise")
                        .imageScale(.large)
                        //.foregroundColor(Color(.systemGray))
                })
    }
}

struct UserContentListView_Preview: PreviewProvider{
    static var previews: some View{
        UserContentListView(user: dev.user)
    }
}

