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
    var numberOfComponentsInPickerView = 1
    
    var openingStateSelected: OpeningStatesType = .All
    var sortingOptionTypeSelected: SortingOptionType = .Alphabetic
    var sortingOrderTypeSelected: SortingOrderType = .Ascending
    
    let jsonFileName = "RestaurantListExample"
    let openingStatesTypesArray: [OpeningStatesType] = OpeningStatesType.allCases.map { $0 }
    let sortingOptionTypesArray: [SortingOptionType] = SortingOptionType.allCases.map { $0 }
    let sortingOrderTypesArray: [SortingOrderType] = SortingOrderType.allCases.map { $0 }
    
    // MARK: - Public Functions
    func loadRestaurantList() {
        guard let list = loadJson(fileName: jsonFileName) else { return }
        separateRestaurantsByOpeningStates(list)
        getPreviousSortingSelection()
    }
    
    func updateInfo() {
        sortByOption(sortingOptionTypeSelected, order: sortingOrderTypeSelected)
    }
    
    // View Info Functions
    func getTitleText() -> String {
        return "Restaurants"
    }
    
    func getOpeningStateSelectedText() -> String {
        return "Opening state:"
    }
    
    func getOpeningStateSelectionButtonText() -> String {
        return "\(openingStateSelected.rawValue) restaurants"
    }
    
    func getOpeningStateSelectionButtonAccessibilityHint() -> String {
        return "Change opening state"
    }
    
    func getSortingOptionSelectedText() -> String {
        return "Sorted by:"
    }
    
    func getSortingOptionSelectionButtonText() -> String {
        return sortingOptionTypeSelected.rawValue
    }
    
    func getSortingOptionSelectionButtonAccessibilityHint() -> String {
        return "Change sorting option"
    }
    
    func getSortingOrderSelectionButtonText() -> String {
        return sortingOrderTypeSelected.rawValue
    }
    
    func getSortingOrderSelectionButtonAccessibilityHint() -> String {
        return "Change sorting order"
    }
    
    // Table View Info Functions
    func getNumberOfSections() -> Int {
        return numberOfSections
    }
    
    func getTitleForHeaderInSection(section: Int) -> String {
        switch section {
        case 0:
            return shouldShowOpeningState(.Open) ? OpeningStatesType.Open.rawValue.uppercased() : ""
        case 1:
            return shouldShowOpeningState(.OrderAhead) ? OpeningStatesType.OrderAhead.rawValue.uppercased() : ""
        case 2:
            return shouldShowOpeningState(.Closed) ? OpeningStatesType.Closed.rawValue.uppercased() : ""
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
    
    func getRestaurantSortingOptionDescritpion() -> String? {
        return sortingOptionTypeSelected == .Alphabetic ? nil : sortingOptionTypeSelected.rawValue
    }
    
    func getRestaurantSortingOptionValue(indexPath: IndexPath) -> String? {
        switch indexPath.section {
        case 0: return getSortingOptionValueForRestaurantList(restaurantListOpen, indexPath: indexPath, sortingType: sortingOptionTypeSelected)
        case 1: return getSortingOptionValueForRestaurantList(restaurantListOrderAhead, indexPath: indexPath, sortingType: sortingOptionTypeSelected)
        case 2: return getSortingOptionValueForRestaurantList(restaurantListClosed, indexPath: indexPath, sortingType: sortingOptionTypeSelected)
        default: return nil
        }
    }
    
    // Picker View Info
    func getNumberOfComponentsInPickerView() -> Int {
        return numberOfComponentsInPickerView
    }
    
    func getNumberOfRowsInPickerView(selectionType: SortingSelectionType) -> Int {
        switch selectionType {
        case .OpeningStates:
            return openingStatesTypesArray.count
        case .Option:
            return sortingOptionTypesArray.count
        case .Order:
            return sortingOrderTypesArray.count
        }
    }
    
    func getTitleForRowInPickerView(_ selectionType: SortingSelectionType, forRow row: Int) -> String {
        switch selectionType {
        case .OpeningStates:
            return openingStatesTypesArray[row].rawValue
        case .Option:
            return sortingOptionTypesArray[row].rawValue
        case .Order:
            return sortingOrderTypesArray[row].rawValue
        }
    }
    
    func getPickerViewTitleText(_ selectionType: SortingSelectionType) -> String {
        switch selectionType {
        case .OpeningStates:
            return "Change opening state"
        case .Option:
            return "Change sorting option type"
        case .Order:
            return "Change sorting order type"
        }
    }
    
    func getAlertDefaultButtonText() -> String {
        return "Ok"
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
    
    private func getPreviousSortingSelection() {
        if let previousOpeningStateSelected = UserDefaultsRepository.shared.getOpeningStateTypeSelected() {
            openingStateSelected = previousOpeningStateSelected
        }
        if let previousSortingOptionTypeSelected = UserDefaultsRepository.shared.getSortingOptionTypeSelected() {
            sortingOptionTypeSelected = previousSortingOptionTypeSelected
        }
        if let previousSortingOrderTypeSelected = UserDefaultsRepository.shared.getSortingOrderTypeSelected() {
            sortingOrderTypeSelected = previousSortingOrderTypeSelected
        }
    }
}
