//
//  GlobalEnums.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 07/04/22.
//

enum OpeningStatesType: String {
    case All = "all"
    case Open = "open"
    case OrderAhead = "order ahead"
    case Closed = "closed"
}

enum SortingOptionType: String {
    case Alphabetic = "Alphabetic"
    case BestMatch = "Best Match"
    case Newest = "Newest"
    case RatingAverage = "Rating Average"
    case Distance = "Distance"
    case Popularity = "Popularity"
    case AverageProductPrice = "Average Product Price"
    case DeliveryCosts = "Delivery Costs"
    case MinCost = "Min Cost"
}

enum SortingOrderType: String {
    case Ascending = "Ascending"
    case Descending = "Descending"
}
