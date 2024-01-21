//
//  SearchController.swift
//  test_app
//
//  Created by Redwan on 15/1/24.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var mTableView : UITableView!
    @IBOutlet weak var searchField : UITextField!
    @IBOutlet weak var searchButton : UIButton!
    
    
    let products : [Product] = [
        
        Product(id: 001, name: "Cricket Bat", description: "High Quality Cricket Bat", inStock: false),
        Product(id: 002, name: "FootBall", description: "High Quality FootBall", inStock: true),
        Product(id: 003, name: "Tennis Ball", description: "High  Quality Tennis Ball", inStock: true),
        Product(id: 004, name: "Hockey Stick", description: "High Quality Hockey  Stick", inStock: true),
        Product(id: 005, name: "Adidas Shoe", description: "High Quality Shoe", inStock: false),
        
    
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search Products"
        self.mTableView.dataSource = self
        self.mTableView.delegate = self 
        
        self.mTableView.register(UINib(nibName: cellIdentifier.searchCell, bundle: nil), forCellReuseIdentifier: cellIdentifier.searchCell)
        
        
        self.mTableView.estimatedRowHeight = 90.0
        self.mTableView.rowHeight = UITableView.automaticDimension

        // Do any additional setup after loading the view.
    }
    


}

extension SearchController: UITableViewDataSource, UITableViewDelegate {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products.count
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90.0
//    }
//    
    
    
    
    
    
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        var cell: UITableViewCell!
//        if let mcell = tableView.dequeueReusableCell(withIdentifier: "Cell") as?
//            UITableViewCell {
//            cell = mcell
//            
//        }else{
//            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
//        }
//        
//        cell.accessoryType = .disclosureIndicator
//        cell.textLabel?.text = products[indexPath.row].name
//        return cell
//        
//        
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: SearchCell!
        if let mcell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier.searchCell) as?
            SearchCell {
            cell = mcell
            
        }else{
            cell = Bundle.main.loadNibNamed(cellIdentifier.searchCell, owner: nil)?.first as! SearchCell
        }
        
        //cell.accessoryType = .disclosureIndicator
        
        let product = self.products[indexPath.row]
        cell.nameLabel?.text = product.name
        cell.descriptionLabel?.text = product.description
        
        if product.inStock {
            
            cell.stockLabel.text = "In Stock"
            cell.stockLabel.textColor = UIColor.green
        }else{
            
            cell.stockLabel.text = "Out Of Stock"
            cell.stockLabel.textColor = UIColor.gray
            
        }
        
        return cell
        
        
    }
    
    
}
