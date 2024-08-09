//
//  CurrentUserProfileView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
    
    @StateObject var viewModel = CurrentUserProfileViewModel()
    @State private var showEditProfile = false
    
    
    private var currentUser: User? {
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack
        {
            ScrollView(showsIndicators: false)
            {
                // bio and stats
                VStack(spacing: 20)
                {
                    
                    ProfileHeaderView(user: currentUser)
                    
                    
                    Button{
                        showEditProfile.toggle()
                    } label:
                    {
                        Text("Edit Profile")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                            .frame(width: 352, height: 32)
                            .background(.white)
                            .cornerRadius(8)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color(.systemGray4), lineWidth: 1)
                            }
                    } // end button
                    
                    // user content list view
                    if let user = currentUser {
                        UserContentListView(user: user)
                    }
                } // end vstack
            } // end scroll view
            .sheet(isPresented: $showEditProfile, content: {
                if let user = currentUser {
                    EditProfileView(user: user)
                }
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        AuthService.shared.signOut()
                    } label: {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    } // end button
                    
                } // end toolbaritem
            } // end toolbar
            .padding(.horizontal)
        } // end navigationstack
    }
}

#Preview {
    CurrentUserProfileView()
}
