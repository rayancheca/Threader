//
//  Timestamp.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 4/17/24.
//

import Foundation
import Firebase

extension Timestamp 
{
    func timestampString() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        return formatter.string(from: self.dateValue(), to: Date()) ?? ""
    } // end function time stamp string
} // end extension timestamp
