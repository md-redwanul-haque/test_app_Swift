//
//  CategoryController.swift
//  test_app
//
//  Created by Redwan on 15/1/24.
//

import UIKit
import Alamofire
import SwiftyJSON


class CategoryController: UIViewController {
    
    @IBOutlet weak var mCollectionVIew: UICollectionView!
    
    var categoryCollectionList : [JSON] = []
    
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
        //for column wise data section 2
        let productNib = UINib(nibName: CellIdentifier.productCell, bundle: nil)
        
        self.mCollectionVIew.register(productNib, forCellWithReuseIdentifier: CellIdentifier.productCell)
        
        // for row wise data in section 1
        let categoryHolderNIb = UINib(nibName: CellIdentifier.categoryHolderCell, bundle: nil)
        self.mCollectionVIew.register(categoryHolderNIb, forCellWithReuseIdentifier: CellIdentifier.categoryHolderCell)
        
        //for header title
        let sectionHeaderNIb = UINib(nibName: CellIdentifier.collectionSectionHeaderView, bundle: nil)
        self.mCollectionVIew.register(sectionHeaderNIb, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.collectionSectionHeaderView)
        
        
        self.fetchProductCategories()
        
    }
}

extension CategoryController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }else{
            return self.products.count
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            
            let categoryHolderCell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.categoryHolderCell, for: indexPath) as! CategoryHolderCell
            
            
            categoryHolderCell.setCategoriesReload(category: self.categoryCollectionList)
            
            categoryHolderCell.categories = self.categoryCollectionList
            
          
            return categoryHolderCell
            
        }else{
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.productCell, for: indexPath) as! ProductCell
            
            
            cell.contentView.applyCorner(cornerRadious: 20.0, borWidth: 0.0)
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
        
        let section = indexPath.section
        if section == 0 {
            
            return CGSize(width: self.view.frame.width, height: 140.0)
        }
        
        return sizeForItem()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 10.0, bottom: 0.0, right: 10.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = mCollectionVIew.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CellIdentifier.collectionSectionHeaderView, for: indexPath) as! CollectionSectionHeaderView
        
        if indexPath.section == 0 {
            header.headerTitleLabel.text = "Product Category"
        }else{
            header.headerTitleLabel.text = "Populer Products"
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
         return CGSize(width: self.view.frame.width, height: 40.0)
    }
    
    
    
}

extension CategoryController{
    
    func fetchProductCategories() {
        
        let url = RestClient.baseUrl + RestClient.categoriyUrl
        
        AF.request(url).responseData{
            
            response in debugPrint(response)
            switch (response.result){
                
            case .success:
                print("validation Successful")
                
                if let responseData = response.value {
                    do {
                        
                        let json = try JSON (data: responseData)
                        
                        if let dataList = json.array{
                            self.categoryCollectionList = dataList
                            
                            self.mCollectionVIew.reloadData()
                        }
                        print("dataList -> \(self.categoryCollectionList)")
                        
                    } catch let error {
                        print(error)
                        
                    }
                    
                }
                
                
            case let .failure(error): print(error)
                
                
            }
            
            
        }
        
        
        
        
    }
    
    
    
}
