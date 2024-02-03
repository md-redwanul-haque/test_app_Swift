//
//  CategoryHolderCell.swift
//  test_app
//
//  Created by Redwan on 30/1/24.
//

import UIKit
import SwiftyJSON
import Kingfisher

class CategoryHolderCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryCollectionView : UICollectionView!
    
/*let categories: [String] = ["Electronics","Books","Accessories","Kitchen","Men","Women","Food"]
 */
    
    var categories : [JSON] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.categoryCollectionView.dataSource = self
        self.categoryCollectionView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout.init()
        flowLayout.scrollDirection = .horizontal
        
        self.categoryCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        
        let categoryCellNib = UINib(nibName: CellIdentifier.categoryCell, bundle: nil)
        
        self.categoryCollectionView.register(categoryCellNib, forCellWithReuseIdentifier: CellIdentifier.categoryCell)
        
        
    }
    
    func setCategoriesReload(category: [JSON]){
        
        self.categories = category
        self.categoryCollectionView.reloadData()
        
    }

}

extension CategoryHolderCell : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("categories.count->\(categories.count)")
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.categoryCell, for: indexPath) as! CategoryCell
        let data = self.categories[indexPath.row]
        if let name = data["name"].string {
            cell.nameLabel.text = name
        }
        
        if let image = data["image"].string , let url = URL(string:image) {
            
            cell.CategoryImageView.kf.setImage(with: url)
        }
        
        //cell.nameLabel.text = categories[indexPath.row]
        cell.nameLabel.applyCorner(cornerRadious: 20.0, borWidth: 0.0)
        return cell
        
    }
    
    
}

extension CategoryHolderCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 130.0, height: 100.0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    
    
    
}
