//
//  SearchCell.swift
//  test_app
//
//  Created by Redwan on 17/1/24.
//

import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var stockLabel : UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}