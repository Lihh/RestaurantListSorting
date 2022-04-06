//
//  RestaurantListViewController+TableView.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

extension RestaurantListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.getTitleForHeaderInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCellId", for: indexPath) as! RestaurantTableViewCell
        let restaurantName = viewModel.getRestaurantName(indexPath: indexPath)
        let restaurantOpeningState = viewModel.getRestaurantOpeningState(indexPath: indexPath)
        cell.setRestaurantCell(name: restaurantName, openingState: restaurantOpeningState)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeightDefaultValue
    }
    
    // MARK: - Public Functions
    func setTableViewDelegates() {
        restaurantListTableView.delegate = self
        restaurantListTableView.dataSource = self
    }
}
