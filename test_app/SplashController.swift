//
//  ViewController.swift
//  test_app
//
//  Created by Redwan on 10/1/24.
//

import UIKit

class SplashController: UIViewController {
    
    @IBOutlet var labelName : UILabel!
    @IBOutlet var labelName2 : UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.labelName.text = "Application Name Title"
        self.labelName2.text = "Application Name Subtitle"
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }


}

