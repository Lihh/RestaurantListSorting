//
//  RestaurantListViewModel.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import Foundation

class RestaurantListViewModel {
    
    // MARK: - Properties
    var restaurantListOpen: [Restaurant] = []
    var restaurantListOrderAhead: [Restaurant] = []
    var restaurantListClosed: [Restaurant] = []
    var numberOfSections = 3
    
    var openingStateSelected: OpeningStatesTypes = .All
    var sortingValueTypeSelected: SortingValueTypes = .Alphabetic
    var sortingOrderTypes: SortingOrderTypes = .Ascending
    
    let jsonFileName = "RestaurantListExample"
    
    // MARK: - Public Functions
    func loadRestaurantList() {
        guard let list = loadJson(fileName: jsonFileName) else { return }
        separateRestaurantsByOpeningStates(list)
    }
    
    func getNumberOfSections() -> Int {
        return numberOfSections
    }
    
    func getTitleForHeaderInSection(section: Int) -> String {
        switch section {
        case 0:
            return shouldShowOpeningState(.Open) ? OpeningStatesTypes.Open.rawValue.uppercased() : ""
        case 1:
            return shouldShowOpeningState(.OrderAhead) ? OpeningStatesTypes.OrderAhead.rawValue.uppercased() : ""
        case 2:
            return shouldShowOpeningState(.Closed) ? OpeningStatesTypes.Closed.rawValue.uppercased() : ""
        default:
            return ""
        }
    }
    
    func getNumberOfRowsInSection(_ section: Int) -> Int {
        switch section {
        case 0:
            return shouldShowOpeningState(.Open) ? restaurantListOpen.count : 0
        case 1:
            return shouldShowOpeningState(.OrderAhead) ? restaurantListOrderAhead.count : 0
        case 2:
            return shouldShowOpeningState(.Closed) ? restaurantListClosed.count : 0
        default:
            return 0
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
    
    private func separateRestaurantsByOpeningStates(_ list: RestaurantList) {
        restaurantListOpen = getOpeningStateRestaurants(inList: list.restaurants, withState: .Open)
        restaurantListOrderAhead = getOpeningStateRestaurants(inList: list.restaurants, withState: .OrderAhead)
        restaurantListClosed = getOpeningStateRestaurants(inList: list.restaurants, withState: .Closed)
    }
    
    private func getOpeningStateRestaurants(inList list: [Restaurant], withState state: OpeningStatesTypes) -> [Restaurant] {
        var newList: [Restaurant] = []
        for restaurant in list {
            if restaurant.status == state.rawValue {
                newList.append(restaurant)
            }
        }
        return newList
    }
    
    private func shouldShowOpeningState(_ state: OpeningStatesTypes) -> Bool {
        return openingStateSelected == .All || openingStateSelected == state ? true : false
    }
}
