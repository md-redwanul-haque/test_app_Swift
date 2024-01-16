//
//  ViewController.swift
//  test_app
//
//  Created by Redwan on 10/1/24.
//

import UIKit

class SplashController: UIViewController {
    
 
    @IBOutlet var labelName2 : UILabel!
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
      self.labelName2.text = "nErim"
        self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self,selector: #selector(makeTransition), userInfo: nil, repeats: false)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("Test1")
        
    }
    
    @objc func makeTransition(){
        
        print("Timer Ended")
        self.timer?.invalidate()
        
        if let currentwindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene{
            
         // Scene gelegate
            
            if let sceneDelegate  = currentwindowScene.delegate as? SceneDelegate ,let window = sceneDelegate.window {
                
//                if let loginViewController  = self.storyboard?.instantiateViewController(withIdentifier: Constants.loginController ) as? LoginController{
//                    
//                    window.rootViewController = loginViewController
//                }
                
                if let authViewController  = self.storyboard?.instantiateViewController(withIdentifier: Constants.authNavigationController ) as? UINavigationController{
                    
                    window.rootViewController = authViewController
                }
                
                
                
                
                
            }
            
        }
        
        
        
        
    }
    



}

