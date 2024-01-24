//
//  CategoryController.swift
//  test_app
//
//  Created by Redwan on 15/1/24.
//

import UIKit

class CategoryController: UIViewController {
    
    @IBOutlet weak var mCollectionVIew: UICollectionView!
    
    let products : [DisplayProduct] = [
        
        DisplayProduct(
            id: 001,
            name: "Cricket Bat",
            description: "High Quality Cricket Bat Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            discountPrice: 200,
            originalPrice: 50,
            addedCount: 0
        ),
        DisplayProduct(
            id: 002,
            name: "FootBall",
            description: "High Quality FootBall",
            discountPrice: 200,
            originalPrice: 50,
            addedCount: 0
        ),
        DisplayProduct(
            id: 003,
            name: "Tennis Ball",
            description: "High  Quality Tennis Ball",
            discountPrice: 200,
            originalPrice: 50,
            addedCount: 0
        ),
        DisplayProduct(
            id: 004,
            name: "Hockey Stick",
            description: "High Quality Hockey  StickLorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
            discountPrice: 200,
            originalPrice: 50,
            addedCount: 0
        ),
        DisplayProduct(
            id: 005,
            name: "Adidas Shoe",
            description: "High Quality Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Shoe",
            discountPrice: 100,
            originalPrice: 50.0,
            addedCount: 0
        ),
        
        
    ]
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Browse Product"
      
        
        self.mCollectionVIew.delegate = self
        self.mCollectionVIew.dataSource = self
        
        self.mCollectionVIew.setCollectionViewLayout(UICollectionViewFlowLayout.init(), animated: true)
        
        let productNib = UINib(nibName: cellIdentifier.productCell, bundle: nil)
        
        self.mCollectionVIew.register(productNib, forCellWithReuseIdentifier: cellIdentifier.productCell)
        
        
    }
}

extension CategoryController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }else{
            return self.products.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSizeMake(160.0, 263.0)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            return UICollectionViewCell(frame: .zero)
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier.productCell, for: indexPath) as! ProductCell
            return cell
            
        }
    }
    

    
    
}
extension CategoryController: UICollectionViewDelegate {
    
    
}

extension CategoryController: UICollectionViewDelegateFlowLayout {
    
    
    
    
    
}
