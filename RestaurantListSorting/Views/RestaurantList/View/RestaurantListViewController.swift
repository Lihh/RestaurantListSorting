//
//  ViewController.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var sortingOptionSelectedLabel: UILabel!
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    // MARK: - Properties
    var viewModel = RestaurantListViewModel()
    let cellHeightDefaultValue: CGFloat = 60
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadRestaurantList()
        setupView()
    }
    
    // MARK: - Private Functions
    private func setupView() {
        titleLabel.text = viewModel.getTitleText()
        sortingOptionSelectedLabel.text = viewModel.getSortingOptionSelectedText()
    }
}

