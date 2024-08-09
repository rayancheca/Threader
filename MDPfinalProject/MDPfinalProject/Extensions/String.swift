//
//  String.swift
//  MDPfinalProject
//
//  Created by Rayan Karim checa on 8/6/24.
//

import UIKit

extension String {
    func heightWithConstrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect,
                                           options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                           attributes: [NSAttributedString.Key.font: font],
                                           context: nil)
        
        return ceil(boundingBox.height)
    }
}
