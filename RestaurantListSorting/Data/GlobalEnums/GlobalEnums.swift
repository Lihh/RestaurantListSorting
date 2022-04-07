//
//  GlobalEnums.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 07/04/22.
//

enum OpeningStatesTypes: String {
    case All = "all"
    case Open = "open"
    case OrderAhead = "order ahead"
    case Closed = "closed"
}

enum SortingValueTypes {
    case Alphabetic
    case BestMatch
    case Newest
    case RatingAverage
    case Distance
    case Popularity
    case AverageProductPrice
    case DeliveryCosts
    case MinCost
}

enum SortingOrderTypes {
    case Ascending
    case Descending
}
