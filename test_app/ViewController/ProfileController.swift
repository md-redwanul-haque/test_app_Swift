//
//  ProfileController.swift
//  test_app
//
//  Created by Redwan on 16/1/24.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var profileImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Profile"
        
        self.profileImage.applyCorner(cornerRadious: self.profileImage.frame.width/2.0, borWidth: 0.0)
        
    }
    
}
