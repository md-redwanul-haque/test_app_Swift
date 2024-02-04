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
        
        self.title = "Login"
        
      
    }
    
   @IBAction  func onClickLoginButton(){
//       let alertController = UIAlertController(title: "Click Event", message: "Login Button Clicked", preferredStyle: .alert)
//      
//       let closeAction = UIAlertAction(title: "Close", style: .cancel)
//       
//       alertController.addAction(closeAction)
//       
//       self.present(alertController, animated: true)
//
       
       
       
       self.Login()
       
       if let currentwindowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene{
           
        // Scene gelegate
           
           if let sceneDelegate  = currentwindowScene.delegate as? SceneDelegate ,let window = sceneDelegate.window {
                              
               if let tabContrl  = self.storyboard?.instantiateViewController(withIdentifier: Constants.tabController ) as? UITabBarController{
                   
                   window.rootViewController = tabContrl
               }
               
               
               
               
               
           }
           
       }
       
       
       
       
       
       
    }
    
    func validateLoginInfo() -> Bool {
        
        guard let email = self.userNameField.text, email.isValidEmail() else {
            self.displayAlert(title: "Email is invalid", message: "Please Enter a valid Email")
            return false
        }
        
        
        guard let password = self.passWordField.text, password.isvaliddPassword() else {
            
            self.displayAlert(title: "Password too Short", message: "Password must be at least 5 character long")
            
            
        }
        
        return true
        
    }
    
    func Login (email: String , password : String){
        
        
        
    }
    
    
    
    @IBAction  func onCLickSignUpButton(){
       if  let signUpController = self.storyboard?.instantiateViewController(withIdentifier: Constants.signUpController) as? SignUpController{
           
           signUpController.value = 20
           
            self.navigationController?.pushViewController(signUpController, animated: true)
            
        }
        
     }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let signupCtrl = segue.destination as? SignUpController{
            
            signupCtrl.value = 50
            
        }
    }
    
    
    
    
    
    

}
