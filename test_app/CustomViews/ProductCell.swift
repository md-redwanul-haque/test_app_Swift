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
    
    func setProductInformation(product: DisplayProduct){
        
        self.productImageView.image = UIImage(systemName:"football")
        self.productNameLabel.text = product.name
        self.productDescriptionLabel.text = product.description
      
        
        let storkeEffect: [NSAttributedString.Key : Any] = [
            NSAttributedString.Key.strikethroughStyle : NSUnderlineStyle.single.rawValue,
            NSAttributedString.Key.strikethroughColor: UIColor.red,
        
        ]
        let originalPrice = NSAttributedString(string: "Tk" + String(product.originalPrice),attributes: storkeEffect)
        
        let finalAttrinutatedString = NSMutableAttributedString()
        
        finalAttrinutatedString.append(originalPrice)
        finalAttrinutatedString.append(NSAttributedString(string: " Tk "))
        finalAttrinutatedString.append(NSAttributedString(string: String(product.discountPrice)))
        self.productPriceLabel.attributedText = finalAttrinutatedString
        
        
    }
    
    

}
