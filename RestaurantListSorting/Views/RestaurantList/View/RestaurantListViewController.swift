//
//  ViewController.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    // MARK: - Properties
    var viewModel = RestaurantListViewModel()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        
        viewModel.loadRestaurantList()
    }
}

