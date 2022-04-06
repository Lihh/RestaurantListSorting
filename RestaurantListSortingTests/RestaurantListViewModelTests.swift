//
//  RestaurantListViewModelTests.swift
//  RestaurantListSortingTests
//
//  Created by Lidia Chou on 06/04/22.
//

import Nimble
import Quick
@testable import RestaurantListSorting

class RestaurantListViewModelTests: QuickSpec {
    
    var subject: RestaurantListViewModel = RestaurantListViewModel()
    let mockedRestaurantList = RestaurantList(restaurants: [Restaurant(name: "Restaurant1", status: "open", sortingValues: SortingValues(bestMatch: 1.0, newest: 1.0, ratingAverage: 1.0, popularity: 1.0, distance: 1, averageProductPrice: 1, deliveryCosts: 1, minCost: 1))])

    override func spec() {
        
        beforeEach {
            self.subject = RestaurantListViewModel()
        }
        
        describe("RestaurantListViewModel behavior unit tests") {
            
            it("Should validate number of rows") {
                self.subject.restaurantList = self.mockedRestaurantList
                expect(self.subject.getNumberOfRows()).to(equal(1))
            }
            
            it("Should validate name of first restaurant") {
                self.subject.restaurantList = self.mockedRestaurantList
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 0))).to(equal("Restaurant1"))
            }
        }
    }
}
