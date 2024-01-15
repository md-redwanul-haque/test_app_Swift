//
//  LoginViewController.swift
//  test_app
//
//  Created by Redwan on 13/1/24.
//

import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var logoImageView : UIImageView!
    
    @IBOutlet weak var  userNameField : UITextField!
    @IBOutlet weak var  passWordField : UITextField!
    @IBOutlet weak var  loginButton : UIButton!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        super.viewDidLoad()
        
        self.logoImageView.applyCorner(cornerRadious: 20, borWidth: 3)
        
     
        
      
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
