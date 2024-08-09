//
//  User.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/13/24.
//

import Foundation


struct User: Identifiable, Codable, Hashable 
{
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl : String?
    var bio: String?
} // end struct user
