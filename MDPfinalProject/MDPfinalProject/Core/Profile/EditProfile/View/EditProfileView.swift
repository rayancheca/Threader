//
//  EditProfileView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View 
{
    let user: User
    
    @State private var bio = ""
    @State private var link = ""
    @State private var isPrivateProfile = false
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = EditProfileViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            ZStack
            {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea([.bottom, .horizontal])
                
                VStack
                {
                    // name and profile image
                    HStack
                    {
                        VStack(alignment: .leading)
                        {
                           Text("Name")
                                .fontWeight(.semibold)
                            
                            Text(user.fullname)
                        } // end VStack
                        
                        Spacer()
                        
                        PhotosPicker(selection: $viewModel.selectedItem){
                            if let image = viewModel.profileImage{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                            }else{
                                CircularProfileImageView(user: user, size: .small)
                            } // end if
                        } // end photos picker
                    } // end HStack
                    
                    Divider()
                    
                    // bio field
                    VStack(alignment: .leading)
                    {
                       Text("Bio")
                            .fontWeight(.semibold)
                        
                        TextField("Enter your bio...", text: $bio, axis: .vertical)
                    } // end VStack
                    
                    Divider()
                    
                    // link field
                    VStack(alignment: .leading)
                    {
                       Text("Link")
                            .fontWeight(.semibold)
                        
                        TextField("Add link...", text: $link)
                    } // end VStack
                    
                    Divider()
                    
                    Toggle("Private profile", isOn: $isPrivateProfile)
                
                } // end Vstack
                .font(.footnote)
                .padding()
                .background(.white)
                .cornerRadius(10)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            } // end ZStack
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar
            {
                ToolbarItem(placement: .topBarLeading)
                {
                    Button("Cancel")
                    {
                        dismiss()
                    }
                    .font(.subheadline)
                    .foregroundColor(.black)
                } // end toolbaritem 1
                
                ToolbarItem(placement: .topBarTrailing)
                {
                    Button("Done")
                    {
                        Task {
                            try await viewModel.updateUserData()
                            dismiss()
                        } // end task
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                } // end toobaritem 2
            } // end toolbar
        } // end NavigationStack
    } // end body
} // end struct

struct EditProfileView_Previews: PreviewProvider{
    static var previews: some View{
        EditProfileView(user: dev.user)
    }
}
