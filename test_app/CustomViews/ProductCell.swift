//
//  ProductCell.swift
//  test_app
//
//  Created by Redwan on 23/1/24.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var itemQuantityLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
