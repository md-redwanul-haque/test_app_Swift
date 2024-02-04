//
//  StringExtension.swift
//  test_app
//
//  Created by Redwan on 4/2/24.
//

import Foundation

extension String {
    
    
    func isValidEmail () ->Bool{
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
        
        
        
    }
    
    func isvaliddPassword() ->Bool {
       
        return self.count > 5
        
    }
    
    
}
