//
//  UserCell.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    
    var body: some View {
        HStack
        {
            CircularProfileImageView(user: user, size: .small)
            
            VStack(alignment: .leading, spacing: 2)
            {
                Text(user.username)
                    .fontWeight(.semibold)
                
                Text(user.fullname)
            
            } // end vstack
            .font(.footnote)
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay{
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        } // end hstack
    .padding(.horizontal)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View{
        UserCell(user: dev.user)
    }
}
