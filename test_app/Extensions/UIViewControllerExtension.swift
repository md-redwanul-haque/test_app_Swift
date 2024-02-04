//
//  UIViewControllerExtension.swift
//  test_app
//
//  Created by Redwan on 4/2/24.
//

import Foundation
import UIKit


extension UIViewController {
    
    
    
    func displayAlert(title:String, message:String){
        
        let closeAction = UIAlertAction(title: "Close", style: .cancel)
        let alertController = UIAlertController(title: title, message: message,preferredStyle: .alert)
        alertController.addAction(closeAction)
        self.present(alertController, animated: true)
        
        
        
        
        
        
    }
    
    
    
    
    
    
}
