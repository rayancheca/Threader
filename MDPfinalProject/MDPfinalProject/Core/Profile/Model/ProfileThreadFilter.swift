//
//  ProfileThreadFilter.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/7/24.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable
{
    case threads
    case replies
    
    var title: String
    {
        switch self
        {
        case .threads: return "Posts"
        case .replies: return "Replies"
        }
    }
    
    var id: Int {return self.rawValue}
}
