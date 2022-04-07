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
    
    // MARK: - Properties
    var subject: RestaurantListViewModel = RestaurantListViewModel()
    
    // MARK: - Mocked Properties
    let mockedRestaurantListOpen = [Restaurant(name: "Restaurant1", status: "open", sortingValues: SortingValues(bestMatch: 1.0, newest: 1.0, ratingAverage: 1.0, popularity: 1.0, distance: 1, averageProductPrice: 1, deliveryCosts: 1, minCost: 1))]
    let mockedRestaurantListOrderAhead = [Restaurant(name: "Restaurant2", status: "order ahead", sortingValues: SortingValues(bestMatch: 2.0, newest: 2.0, ratingAverage: 2.0, popularity: 2.0, distance: 2, averageProductPrice: 2, deliveryCosts: 2, minCost: 2))]
    let mockedRestaurantListClosed = [Restaurant(name: "Restaurant3", status: "closed", sortingValues: SortingValues(bestMatch: 3.0, newest: 3.0, ratingAverage: 3.0, popularity: 3.0, distance: 3, averageProductPrice: 3, deliveryCosts: 3, minCost: 3))]

    override func spec() {
        
        beforeEach {
            self.subject = RestaurantListViewModel()
            self.subject.restaurantListOpen = self.mockedRestaurantListOpen
            self.subject.restaurantListOrderAhead = self.mockedRestaurantListOrderAhead
            self.subject.restaurantListClosed = self.mockedRestaurantListClosed
        }
        
        describe("RestaurantListViewModel behavior unit tests") {
            
            it("Should validate number of sections") {
                expect(self.subject.getNumberOfSections()).to(equal(3))
            }
            
            it("Should validate section header titles") {
                expect(self.subject.getTitleForHeaderInSection(section: 0)).to(equal("OPEN"))
                expect(self.subject.getTitleForHeaderInSection(section: 1)).to(equal("ORDER AHEAD"))
                expect(self.subject.getTitleForHeaderInSection(section: 2)).to(equal("CLOSED"))
                expect(self.subject.getTitleForHeaderInSection(section: 3)).to(equal(""))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = All") {
                self.subject.openingStateSelected = .All
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = Open") {
                self.subject.openingStateSelected = .Open
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = OrderAhead") {
                self.subject.openingStateSelected = .OrderAhead
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = Closed") {
                self.subject.openingStateSelected = .Closed
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(1))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate name of restaurants") {
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 0))).to(equal("Restaurant1"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 1))).to(equal("Restaurant2"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 2))).to(equal("Restaurant3"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 3))).to(equal(""))
            }
        }
    }
}
