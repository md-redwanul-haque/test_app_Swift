//
//  SearchCell.swift
//  test_app
//
//  Created by Redwan on 22/1/24.
//
import UIKit

class SearchCell: UITableViewCell {
    
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var stockLabel : UILabel!
    @IBOutlet weak var productImage : UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
