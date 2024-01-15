//
//  LoginViewController.swift
//  test_app
//
//  Created by Redwan on 13/1/24.
//

import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
   @IBAction  func onClickLoginButton(){
       let alertController = UIAlertController(title: "Click Event", message: "Login Button Clicked", preferredStyle: .alert)
      
       let closeAction = UIAlertAction(title: "Close", style: .cancel)
       
       alertController.addAction(closeAction)
       
       self.present(alertController, animated: true)
        
    }

}
