//
//  UIVIewExtension.swift
//  test_app
//
//  Created by Redwan on 14/1/24.
//

import Foundation
import UIKit


extension UIView {
    
    public func applyCorner (cornerRadious : Double , borWidth: Double ) {
        
        self.layer.borderWidth = borWidth
        self.layer.cornerRadius = cornerRadious
        self.clipsToBounds = true
        
    }
    
}
 
