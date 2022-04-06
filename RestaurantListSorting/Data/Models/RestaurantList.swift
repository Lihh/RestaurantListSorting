//
//  RestaurantList.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

struct RestaurantList: Codable {
    let restaurants: [Restaurant]
}

struct Restaurant: Codable {
    let name, status: String
    let sortingValues: SortingValues
}

struct SortingValues: Codable {
    let bestMatch, newest, ratingAverage, popularity: Double
    let distance, averageProductPrice, deliveryCosts, minCost: Int
}
