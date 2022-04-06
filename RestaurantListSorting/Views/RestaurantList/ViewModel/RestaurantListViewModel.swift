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
    var restaurantListOpen: [Restaurant] = []
    var restaurantListOrderAhead: [Restaurant] = []
    var restaurantListClosed: [Restaurant] = []
    var numberOfSections = 3
    let jsonFileName = "RestaurantListExample"
    let openingStateOpen = "open"
    let openingStateOrderAhead = "order ahead"
    let openingStateClosed = "closed"
    
    // MARK: - Public Functions
    func loadRestaurantList() {
        guard let list = loadJson(fileName: jsonFileName) else { return }
        restaurantList = list
        separateOpeningStates()
    }
    
    func getNumberOfSections() -> Int {
        return numberOfSections
    }
    
    func getTitleForHeaderInSection(section: Int) -> String {
        switch section {
        case 0: return openingStateOpen.uppercased()
        case 1: return openingStateOrderAhead.uppercased()
        case 2: return openingStateClosed.uppercased()
        default: return ""
        }
    }
    
    func getNumberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0: return restaurantListOpen.count
        case 1: return restaurantListOrderAhead.count
        case 2: return restaurantListClosed.count
        default: return 0
        }
    }
    
    func getRestaurantName(indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0: return restaurantListOpen[indexPath.row].name
        case 1: return restaurantListOrderAhead[indexPath.row].name
        case 2: return restaurantListClosed[indexPath.row].name
        default: return ""
        }
    }
    
    func getRestaurantOpeningState(indexPath: IndexPath) -> String {
        switch indexPath.section {
        case 0: return restaurantListOpen[indexPath.row].status
        case 1: return restaurantListOrderAhead[indexPath.row].status
        case 2: return restaurantListClosed[indexPath.row].status
        default: return ""
        }
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
    
    private func separateOpeningStates() {
        guard let restaurantList = restaurantList else { return }
        restaurantListOpen = getOpeningStateRestaurants(inList: restaurantList.restaurants, withState: openingStateOpen)
        restaurantListOrderAhead = getOpeningStateRestaurants(inList: restaurantList.restaurants, withState: openingStateOrderAhead)
        restaurantListClosed = getOpeningStateRestaurants(inList: restaurantList.restaurants, withState: openingStateClosed)
    }
    
    private func getOpeningStateRestaurants(inList list: [Restaurant], withState state: String) -> [Restaurant] {
        var newList: [Restaurant] = []
        for restaurant in list {
            if restaurant.status == state {
                newList.append(restaurant)
            }
        }
        return newList
    }
}
