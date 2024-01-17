//
//  ProfileController.swift
//  test_app
//
//  Created by Redwan on 16/1/24.
//

import UIKit
import ActionKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var notifySwitch: UISwitch!
    @IBOutlet weak var notifyLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Profile"
        
        self.profileImage.applyCorner(cornerRadious: self.profileImage.frame.width/2.0, borWidth: 0.0)
        
        
        self.notifySwitch.addControlEvent(.valueChanged){
            
            print("Switch --> \(self.notifySwitch.isOn)")
            if self.notifySwitch.isOn {
                
                self.notifyLabel.text = "Notify Me When Order Processed"
                
            }else{
                
                self.notifyLabel.text = "Don't Notify Me When Order Processed"
            }
            }
        let singleTapGestureRec = UITapGestureRecognizer(){
            self.view.backgroundColor = getRandomColor()
            print("Gesture Worikng")
        }
        self.notifyLabel.isUserInteractionEnabled = true
        self.notifyLabel.addGestureRecognizer(singleTapGestureRec)
        
        func getRandomColor() ->UIColor{
            return UIColor(red: randomNumber(), green: randomNumber(), blue: randomNumber(), alpha: randomNumber() )
            
        }
        
        func randomNumber() -> Double{
            return Double(arc4random() % 255) / 255.0
            
            
            
        }
        
        
    }
    
    

    
    
//    @IBAction func notifySwitchChanged (){
//        
//        print("Switch --> \(self.notifySwitch.isOn)")
//        if self.notifySwitch.isOn {
//            
//            self.notifyLabel.text = "Notify Me When Order Processed"
//            
//        }else{
//            
//            self.notifyLabel.text = "Don't Notify Me When Order Processed"
//        }
//        
//        
//    }
    
    
}
