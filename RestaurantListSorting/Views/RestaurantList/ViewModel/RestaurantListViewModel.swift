//
//  RestaurantListViewModel.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import Foundation

class RestaurantListViewModel {
    
    // MARK: - Properties
    var restaurantList: RestaurantList? = nil
    let jsonFileName = "RestaurantListExample"
    
    // MARK: - Public Functions
    func loadRestaurantList() {
        guard let list = loadJson(fileName: jsonFileName) else { return }
        restaurantList = list
    }
    
    func getNumberOfRows() -> Int {
        return restaurantList?.restaurants.count ?? 0
    }
    
    func getRestaurantName(indexPath: IndexPath) -> String {
        return restaurantList?.restaurants[indexPath.row].name ?? ""
    }
    
    // MARK: - Private Functions
    private func loadJson(fileName: String) -> RestaurantList? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(RestaurantList.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
