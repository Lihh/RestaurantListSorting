//
//  RestaurantListViewModel+SortingOptions.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 07/04/22.
//

import Foundation

extension RestaurantListViewModel {
    
    // MARK: - Public Functions
    // Sort Opening States
    func separateRestaurantsByOpeningStates(_ list: RestaurantList) {
        restaurantListOpen = getOpeningStateRestaurants(inList: list.restaurants, withState: .Open)
        restaurantListOrderAhead = getOpeningStateRestaurants(inList: list.restaurants, withState: .OrderAhead)
        restaurantListClosed = getOpeningStateRestaurants(inList: list.restaurants, withState: .Closed)
    }
    
    func shouldShowOpeningState(_ state: OpeningStatesType) -> Bool {
        return openingStateSelected == .All || openingStateSelected == state ? true : false
    }
    
    // Sort by Option Values and Order
    func sortByOption(_ option: SortingOptionType, order: SortingOrderType) {
        switch option {
        case .Alphabetic:
            sortByAlphabet(order: order)
        case .BestMatch:
            sortByBestMatch(order: order)
        case .Newest:
            sortByNewest(order: order)
        case .RatingAverage:
            sortByRatingAverage(order: order)
        case .Distance:
            sortByDistance(order: order)
        case .Popularity:
            sortByPopularity(order: order)
        case .AverageProductPrice:
            sortByAverageProductPrice(order: order)
        case .DeliveryCosts:
            sortByDeliveryCosts(order: order)
        case .MinCost:
            sortByMinCost(order: order)
        }
    }
    
    func getSortingOptionValueForRestaurantList(_ list: [Restaurant], indexPath: IndexPath, sortingType: SortingOptionType) -> String? {
        switch sortingType {
        case .Alphabetic:
            return nil
        case .BestMatch:
            return String(list[indexPath.row].sortingValues.bestMatch)
        case .Newest:
            return String(list[indexPath.row].sortingValues.newest)
        case .RatingAverage:
            return String(list[indexPath.row].sortingValues.ratingAverage)
        case .Distance:
            return String(list[indexPath.row].sortingValues.distance)
        case .Popularity:
            return String(list[indexPath.row].sortingValues.popularity)
        case .AverageProductPrice:
            return String(list[indexPath.row].sortingValues.averageProductPrice)
        case .DeliveryCosts:
            return String(list[indexPath.row].sortingValues.deliveryCosts)
        case .MinCost:
            return String(list[indexPath.row].sortingValues.minCost)
        }
    }
    
    // MARK: - Private Functions
    // Opening States Functions
    private func getOpeningStateRestaurants(inList list: [Restaurant], withState state: OpeningStatesType) -> [Restaurant] {
        var newList: [Restaurant] = []
        for restaurant in list {
            if restaurant.status == state.rawValue {
                newList.append(restaurant)
            }
        }
        return newList
    }
    
    // Sorting Order Functions
    private func isOrderAscending(_ order: SortingOrderType) -> Bool {
        return order == .Ascending
    }
    
    // Option Values and Order Functions
    private func sortByAlphabet(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.name < $1.name }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.name < $1.name }
            restaurantListClosed = restaurantListClosed.sorted { $0.name < $1.name }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.name < $0.name }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.name < $0.name }
            restaurantListClosed = restaurantListClosed.sorted { $1.name < $0.name }
        }
    }
    
    private func sortByBestMatch(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.bestMatch < $1.sortingValues.bestMatch }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.bestMatch < $1.sortingValues.bestMatch }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.bestMatch < $1.sortingValues.bestMatch }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.bestMatch < $0.sortingValues.bestMatch }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.bestMatch < $0.sortingValues.bestMatch }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.bestMatch < $0.sortingValues.bestMatch }
        }
    }
    
    private func sortByNewest(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.newest < $1.sortingValues.newest }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.newest < $1.sortingValues.newest }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.newest < $1.sortingValues.newest }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.newest < $0.sortingValues.newest }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.newest < $0.sortingValues.newest }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.newest < $0.sortingValues.newest }
        }
    }
    
    private func sortByRatingAverage(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.ratingAverage < $1.sortingValues.ratingAverage }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.ratingAverage < $1.sortingValues.ratingAverage }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.ratingAverage < $1.sortingValues.ratingAverage }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.ratingAverage < $0.sortingValues.ratingAverage }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.ratingAverage < $0.sortingValues.ratingAverage }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.ratingAverage < $0.sortingValues.ratingAverage }
        }
    }
    
    private func sortByDistance(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.distance < $1.sortingValues.distance }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.distance < $1.sortingValues.distance }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.distance < $1.sortingValues.distance }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.distance < $0.sortingValues.distance }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.distance < $0.sortingValues.distance }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.distance < $0.sortingValues.distance }
        }
    }
    
    private func sortByPopularity(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.popularity < $1.sortingValues.popularity }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.popularity < $1.sortingValues.popularity }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.popularity < $1.sortingValues.popularity }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.popularity < $0.sortingValues.popularity }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.popularity < $0.sortingValues.popularity }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.popularity < $0.sortingValues.popularity }
        }
    }
    
    private func sortByAverageProductPrice(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.averageProductPrice < $1.sortingValues.averageProductPrice }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.averageProductPrice < $1.sortingValues.averageProductPrice }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.averageProductPrice < $1.sortingValues.averageProductPrice }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.averageProductPrice < $0.sortingValues.averageProductPrice }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.averageProductPrice < $0.sortingValues.averageProductPrice }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.averageProductPrice < $0.sortingValues.averageProductPrice }
        }
    }
    
    private func sortByDeliveryCosts(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.deliveryCosts < $1.sortingValues.deliveryCosts }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.deliveryCosts < $1.sortingValues.deliveryCosts }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.deliveryCosts < $1.sortingValues.deliveryCosts }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.deliveryCosts < $0.sortingValues.deliveryCosts }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.deliveryCosts < $0.sortingValues.deliveryCosts }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.deliveryCosts < $0.sortingValues.deliveryCosts }
        }
    }
    
    private func sortByMinCost(order: SortingOrderType) {
        if isOrderAscending(order) {
            restaurantListOpen = restaurantListOpen.sorted { $0.sortingValues.minCost < $1.sortingValues.minCost }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $0.sortingValues.minCost < $1.sortingValues.minCost }
            restaurantListClosed = restaurantListClosed.sorted { $0.sortingValues.minCost < $1.sortingValues.minCost }
        } else {
            restaurantListOpen = restaurantListOpen.sorted { $1.sortingValues.minCost < $0.sortingValues.minCost }
            restaurantListOrderAhead = restaurantListOrderAhead.sorted { $1.sortingValues.minCost < $0.sortingValues.minCost }
            restaurantListClosed = restaurantListClosed.sorted { $1.sortingValues.minCost < $0.sortingValues.minCost }
        }
    }
}
