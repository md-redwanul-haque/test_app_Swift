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
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            return UICollectionViewCell(frame: .zero)
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier.productCell, for: indexPath) as! ProductCell
            
            let product = self.products[row]
            cell.setProductInformation(product: product)
            
            return cell
            
        }
    }
    

    
    
}

extension CategoryController{
    
    func sizeForItem() -> CGSize {
        let screenWidth = self.view.frame.width
        let spacingBetweenItems = 10.0
        let spacingAtEdges = 10.0
        let numberOfItemsInEachRow = 2
        let totalSpacing = (spacingAtEdges * 2) + (Double((numberOfItemsInEachRow-1)) * spacingBetweenItems)
        let itemWidth = (screenWidth - totalSpacing) / 2
        
        
        return CGSize(width: itemWidth, height: 265.0)
    }
    
    
}

extension CategoryController: UICollectionViewDelegate {
    
    
}

extension CategoryController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return sizeForItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 10.0, right: 10.0)
    }
    
    
    
}
