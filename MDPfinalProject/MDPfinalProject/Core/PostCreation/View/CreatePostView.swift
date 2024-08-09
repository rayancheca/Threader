//
//  CreatePostView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct CreatePostView: View 
{
    @StateObject var viewModel = CreatePostViewModel()
    @State private var caption = ""
    @Environment(\.dismiss) var dismiss
    
    private var user: User? {
        return UserService.shared.currentUser
    }
    
    var body: some View
    {
        NavigationStack
        {
            VStack
            {
                HStack(alignment: .top)
                {
                    CircularProfileImageView(user: user, size: .small)
                    
                    VStack(alignment: .leading, spacing: 4)
                    {
                        Text(user?.username ?? "")
                            .fontWeight(.semibold)
                        
                        TextField("Start Post", text: $caption, axis: .vertical)
                    } // end vstack
                    .font(.footnote)
                    
                    Spacer()
                    
                    if !caption.isEmpty
                    {
                        // x button
                        Button(action:
                        {
                            caption = ""
                        }, label: {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 12, height: 12)
                                .foregroundColor(.gray)
                        }) // end button
                    }

                } // end hstack
                
                Spacer()
            } // end vstack
            .padding()
            .navigationTitle("New Post")
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
                        Task { try await viewModel.uploadThread(caption: caption)
                            dismiss()
                        }
                    }
                    .opacity(caption.isEmpty ? 0.5 : 1.0)
                    .disabled(caption.isEmpty)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                } // end toolbaritem 2
            } // end toolbar
        } // end navigation Stack
    } // end body
} // end struct

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View{
        CreatePostView()
    }
}
