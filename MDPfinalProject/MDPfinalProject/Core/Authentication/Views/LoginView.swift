//
//  LoginView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct LoginView: View 
{
 
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View
    {
        NavigationStack
        {
            //start vstack1
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
                        .autocapitalization(.none)
                        .modifier(TextFieldModifier())
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(TextFieldModifier())
                } //end vstack 2
                //start navigationlink 1
                NavigationLink
                {
                    Text("Forgot Password")
                } label:
                {
                    Text("Forgot Password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 20)
                        .foregroundColor(.black)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
                } //end navigationlinkm 1

                //start button
                Button
                {
                    Task{ try await viewModel.login() }
                }label:
                {
                    Text("Login")
                        .modifier(ButtonModifier())
                }//end button
                
                Spacer()
                
                Divider()
                
                //start navlink2
                NavigationLink
                {
                    RegistrationView()
                        .navigationBarBackButtonHidden(true)
                } label:
                {
                    HStack(spacing: 3)
                    {
                        Text("Don't have an account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }//end hstack
                    .font(.footnote)
                    .foregroundColor(.black)
                }//end navlink2
                .padding(.vertical, 16)
            } //end vstack 1
        }
    }
}

#Preview 
{
    LoginView()
}
