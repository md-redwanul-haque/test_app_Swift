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
    
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var bioLabel : UILabel!
    

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
        
        self.nameLabel.text = "Lorem Ipsum popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        self.bioLabel.text = "is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        
        
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
