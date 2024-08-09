//
//  RegistrationView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct RegistrationView: View 
{
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View
    {
        //start vstack 1
        VStack
        {
            Spacer()
            Image("-app-icon")
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
                .padding()
            
            //start vstack2
            VStack
            {
                TextField("Enter your email ",text:  $viewModel.email)
                    .modifier(TextFieldModifier())
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your full name ",text: $viewModel.fullname)
                    .modifier(TextFieldModifier())
                
                TextField("Enter your username ",text:  $viewModel.username)
                    .modifier(TextFieldModifier())
            } //end vstack 2
            
            //start button
            Button
            {
                Task { try await viewModel.createUser() }
            }label:
            {
                Text("Sign Up")
                    .modifier(ButtonModifier())
            }//end button
            .padding(.vertical)
            
            Spacer()
            
            Divider()
            
            //start button
            Button
            {
                dismiss()
            }label: {
                HStack(spacing: 3)
                {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }//end hstack
                .font(.footnote)
                .foregroundColor(.black)
            }//end button
            .padding(.vertical, 16)
        }//end vstack 1
    } //end body
}//end struct

#Preview {
    RegistrationView()
}
