//
//  ExploreView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct ExploreView: View 
{
    @State private var searchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            ScrollView
            {
                LazyVStack
                {
                    ForEach(viewModel.users){ user in
                        NavigationLink(value: user) {
                            VStack
                            {
                                UserCell(user: user)
                            
                            Divider()
                            }
                            .padding(.vertical, 4)
                        }
                    } // end for loop
                } // end lazy vstack
            } // end scrollview
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search" )
            
        } // end navigationstack
    } // end body
    
} // end struct

#Preview 
{
    ExploreView()
}
