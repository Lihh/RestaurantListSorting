//
//  RestaurantListViewController+TableView.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

extension RestaurantListViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table View Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCellId", for: indexPath) as! RestaurantTableViewCell
        let restaurantName = viewModel.getRestaurantName(indexPath: indexPath)
        cell.setRestaurantCell(name: restaurantName)
        return cell
    }
    
    // MARK: - Public Functions
    func setTableViewDelegates() {
        restaurantListTableView.delegate = self
        restaurantListTableView.dataSource = self
    }
}
