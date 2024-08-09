//
//  ProfileView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct ProfileView: View
{
    let user: User
 
    var body: some View
    {
        ScrollView(showsIndicators: false)
        {
            // bio and stats
            VStack(spacing: 20)
            {
                ProfileHeaderView(user: user)
                
                Button{
                    
                } label:
                {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                } // end button
                
                // user content list view
                UserContentListView(user: user)
    
            } // end vstack
        } // end scroll view
        .navigationBarTitleDisplayMode(.inline)
        .padding(.horizontal)
    } // end body
} // end struct

struct ProfileView_Previews: PreviewProvider{
    static var previews: some View{
        ProfileView(user: dev.user)
    }
}
