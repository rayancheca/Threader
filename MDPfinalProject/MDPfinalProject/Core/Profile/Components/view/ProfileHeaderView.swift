//
//  ProfileHeaderView.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User?){
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top)
        {
            VStack(alignment: .leading, spacing: 12)
            {
                //full name and username
                VStack(alignment: .leading, spacing: 4)
                {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                } // end vstack
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("200 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider{
    static var previews: some View {
        ProfileHeaderView(user: dev.user)
    }

}

