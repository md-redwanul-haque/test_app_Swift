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
        
        Product(id: 001, name: "Pro_1", description: "Pro_Des_1", inStock: true),
        Product(id: 002, name: "Pro_2", description: "Pro_Des_2", inStock: true),
        Product(id: 003, name: "Pro_3", description: "Pro_Des_3", inStock: true),
        Product(id: 004, name: "Pro_4", description: "Pro_Des_4", inStock: true),
        Product(id: 005, name: "Pro_5", description: "Pro_Des_5", inStock: true),
        
    
    ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Search Products"
        self.mTableView.dataSource = self
        self.mTableView.delegate = self 

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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        if let mcell = tableView.dequeueReusableCell(withIdentifier: "Cell") as?
            UITableViewCell {
            cell = mcell
            
        }else{
            cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        }
        
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = products[indexPath.row].name
        return cell
        
        
    }
    
    
    
}
