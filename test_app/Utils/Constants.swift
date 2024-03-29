//
//  Constants.swift
//  test_app
//
//  Created by Redwan on 13/1/24.
//

import Foundation

class Constants {
    
    public static let loginController  = "LoginController"
    public static let authNavigationController = "AuthNavigationController"
    
    public static let signUpController = "SignUpController"
    public static let tabController  = "TabController"
    public static let profileController  = "ProfileController"

    
    
}

class CellIdentifier{
    public static let searchCell  = "SearchCell"
    public static let productCell  = "ProductCell"
    public static let categoryHolderCell  = "CategoryHolderCell"
    public static let categoryCell  = "CategoryCell"
    public static let collectionSectionHeaderView  = "CollectionSectionHeaderView"

    
}


class RestClient {
    
    public static let baseUrl = "https://api.escuelajs.co"
    public static let categoriyUrl = "/api/v1/categories"
    public static let loginUrl = "api/v1/auth/login"
    
}


