//
//  UserDefaultsRepository.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 08/04/22.
//

import Foundation

class UserDefaultsRepository {
    
    // MARK: - Properties
    static let shared = UserDefaultsRepository()
    private let userDefaults = UserDefaults.standard
    
    // MARK: - Public Functions
    func saveOpeningStateTypeSelected(_ type: OpeningStatesType) {
        userDefaults.set(type.rawValue, forKey: UserDefaultsKeys.OpeningStatesTypeSelectedKey)
    }
    
    func saveSortingOptionTypeSelected(_ type: SortingOptionType) {
        userDefaults.set(type.rawValue, forKey: UserDefaultsKeys.SortingOptionTypeSelectedKey)
    }
    
    func saveSortingOrderTypeSelected(_ type: SortingOrderType) {
        userDefaults.set(type.rawValue, forKey: UserDefaultsKeys.SortingOrderTypeSelectedKey)
    }
    
    func getOpeningStateTypeSelected() -> OpeningStatesType? {
        guard let openingStateTypeSelected = userDefaults.object(forKey: UserDefaultsKeys.OpeningStatesTypeSelectedKey) as? String, let typeSelected = OpeningStatesType(rawValue: openingStateTypeSelected) else { return nil }
        return typeSelected
    }
    
    func getSortingOptionTypeSelected() -> SortingOptionType? {
        guard let sortingOptionTypeSelected = userDefaults.object(forKey: UserDefaultsKeys.SortingOptionTypeSelectedKey) as? String, let typeSelected = SortingOptionType(rawValue: sortingOptionTypeSelected) else { return nil }
        return typeSelected
    }
    
    func getSortingOrderTypeSelected() -> SortingOrderType? {
        guard let sortingOrderTypeSelected = userDefaults.object(forKey: UserDefaultsKeys.SortingOrderTypeSelectedKey) as? String, let typeSelected = SortingOrderType(rawValue: sortingOrderTypeSelected)  else { return nil }
        return typeSelected
    }
}
