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
    let mockedRestaurantListOpen = [Restaurant(name: "Restaurant1", status: "open", sortingValues: SortingValues(bestMatch: 1.0, newest: 1.0, ratingAverage: 1.0, popularity: 1.0, distance: 1, averageProductPrice: 1, deliveryCosts: 1, minCost: 1)), Restaurant(name: "Restaurant2", status: "open", sortingValues: SortingValues(bestMatch: 2.0, newest: 2.0, ratingAverage: 2.0, popularity: 2.0, distance: 2, averageProductPrice: 2, deliveryCosts: 2, minCost: 2))]
    let mockedRestaurantListOrderAhead = [Restaurant(name: "Restaurant3", status: "order ahead", sortingValues: SortingValues(bestMatch: 3.0, newest: 3.0, ratingAverage: 3.0, popularity: 3.0, distance: 3, averageProductPrice: 3, deliveryCosts: 3, minCost: 3)), Restaurant(name: "Restaurant4", status: "order ahead", sortingValues: SortingValues(bestMatch: 4.0, newest: 4.0, ratingAverage: 4.0, popularity: 4.0, distance: 4, averageProductPrice: 4, deliveryCosts: 4, minCost: 4))]
    let mockedRestaurantListClosed = [Restaurant(name: "Restaurant5", status: "closed", sortingValues: SortingValues(bestMatch: 5.0, newest: 5.0, ratingAverage: 5.0, popularity: 5.0, distance: 5, averageProductPrice: 5, deliveryCosts: 5, minCost: 5)), Restaurant(name: "Restaurant6", status: "closed", sortingValues: SortingValues(bestMatch: 6.0, newest: 6.0, ratingAverage: 6.0, popularity: 6.0, distance: 6, averageProductPrice: 6, deliveryCosts: 6, minCost: 6))]

    override func spec() {
        
        beforeEach {
            self.subject = RestaurantListViewModel()
            self.subject.restaurantListOpen = self.mockedRestaurantListOpen
            self.subject.restaurantListOrderAhead = self.mockedRestaurantListOrderAhead
            self.subject.restaurantListClosed = self.mockedRestaurantListClosed
        }
        
        describe("RestaurantListViewModel behavior unit tests") {
            
            // View Info Functions Validation
            it("Should validate title label text") {
                expect(self.subject.getTitleText()).to(equal("Restaurants"))
            }
            
            it("Should validate opening state selected label text") {
                expect(self.subject.getOpeningStateSelectedText()).to(equal("Opening state:"))
            }
            
            it("Should validate opening state selection button text for openingStateSelected = All") {
                self.subject.openingStateSelected = .All
                expect(self.subject.getOpeningStateSelectionButtonText()).to(equal("all restaurants"))
            }
            
            it("Should validate opening state selection button text for openingStateSelected = Open") {
                self.subject.openingStateSelected = .Open
                expect(self.subject.getOpeningStateSelectionButtonText()).to(equal("open restaurants"))
            }
            
            it("Should validate opening state selection button text for openingStateSelected = OrderAhead") {
                self.subject.openingStateSelected = .OrderAhead
                expect(self.subject.getOpeningStateSelectionButtonText()).to(equal("order ahead restaurants"))
            }
            
            it("Should validate opening state selection button text for openingStateSelected = Closed") {
                self.subject.openingStateSelected = .Closed
                expect(self.subject.getOpeningStateSelectionButtonText()).to(equal("closed restaurants"))
            }
            
            it("Should validate opening state selection button accessibility hint") {
                expect(self.subject.getOpeningStateSelectionButtonAccessibilityHint()).to(equal("Change opening state"))
            }
            
            it("Should validate sorting option selected label text") {
                expect(self.subject.getSortingOptionSelectedText()).to(equal("Sorted by:"))
            }
            
            it("Should validate sorting option selection button text for sortingOptionTypeSelected = Alphabetic") {
                self.subject.sortingOptionTypeSelected = .Alphabetic
                expect(self.subject.getSortingOptionSelectionButtonText()).to(equal("Alphabetic"))
            }
            
            it("Should validate sorting option selection button text for sortingOptionTypeSelected = Newest") {
                self.subject.sortingOptionTypeSelected = .Newest
                expect(self.subject.getSortingOptionSelectionButtonText()).to(equal("Newest"))
            }
            
            it("Should validate sorting option selection button accessibility hint") {
                expect(self.subject.getSortingOptionSelectionButtonAccessibilityHint()).to(equal("Change sorting option"))
            }
            
            it("Should validate sorting order selection button text for sortingOrderTypeSelected = Ascending") {
                self.subject.sortingOrderTypeSelected = .Ascending
                expect(self.subject.getSortingOrderSelectionButtonText()).to(equal("Ascending"))
            }
            
            it("Should validate sorting order selection button text for sortingOrderTypeSelected = Descending") {
                self.subject.sortingOrderTypeSelected = .Descending
                expect(self.subject.getSortingOrderSelectionButtonText()).to(equal("Descending"))
            }
            
            it("Should validate sorting order selection button accessibility hint") {
                expect(self.subject.getSortingOrderSelectionButtonAccessibilityHint()).to(equal("Change sorting order"))
            }
            
            // Table View Info Functions Validation
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
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = Open") {
                self.subject.openingStateSelected = .Open
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = OrderAhead") {
                self.subject.openingStateSelected = .OrderAhead
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate number of rows in sections for openingStateSelected = Closed") {
                self.subject.openingStateSelected = .Closed
                expect(self.subject.getNumberOfRowsInSection(0)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(1)).to(equal(0))
                expect(self.subject.getNumberOfRowsInSection(2)).to(equal(2))
                expect(self.subject.getNumberOfRowsInSection(3)).to(equal(0))
            }
            
            it("Should validate name of restaurants") {
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 0))).to(equal("Restaurant1"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 1))).to(equal("Restaurant3"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 2))).to(equal("Restaurant5"))
                expect(self.subject.getRestaurantName(indexPath: IndexPath(row: 0, section: 3))).to(equal(""))
            }
            
            it("Should validate restaurant sorting option description for Alphabetic option") {
                self.subject.sortingOptionTypeSelected = .Alphabetic
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(beNil())
            }
            
            it("Should validate restaurant sorting option description for Best Match option") {
                self.subject.sortingOptionTypeSelected = .BestMatch
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Best Match"))
            }
            
            it("Should validate restaurant sorting option description for Newest option") {
                self.subject.sortingOptionTypeSelected = .Newest
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Newest"))
            }
            
            it("Should validate restaurant sorting option description for Rating Average option") {
                self.subject.sortingOptionTypeSelected = .RatingAverage
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Rating Average"))
            }
            
            it("Should validate restaurant sorting option description for Distance option") {
                self.subject.sortingOptionTypeSelected = .Distance
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Distance"))
            }
            
            it("Should validate restaurant sorting option description for Popularity option") {
                self.subject.sortingOptionTypeSelected = .Popularity
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Popularity"))
            }
            
            it("Should validate restaurant sorting option description for Average Product Price option") {
                self.subject.sortingOptionTypeSelected = .AverageProductPrice
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Average Product Price"))
            }
            
            it("Should validate restaurant sorting option description for Delivery Costs option") {
                self.subject.sortingOptionTypeSelected = .DeliveryCosts
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Delivery Costs"))
            }
            
            it("Should validate restaurant sorting option description for Min Cost option") {
                self.subject.sortingOptionTypeSelected = .MinCost
                expect(self.subject.getRestaurantSortingOptionDescritpion()).to(equal("Min Cost"))
            }
            
            it("Should validate sorting option value for Alphabetic option") {
                self.subject.sortingOptionTypeSelected = .Alphabetic
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(beNil())
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(beNil())
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(beNil())
            }
            
            it("Should validate sorting option value for Best Match option") {
                self.subject.sortingOptionTypeSelected = .BestMatch
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5.0"))
            }
            
            it("Should validate sorting option value for Newest option") {
                self.subject.sortingOptionTypeSelected = .Newest
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5.0"))
            }
            
            it("Should validate sorting option value for Rating Average option") {
                self.subject.sortingOptionTypeSelected = .RatingAverage
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5.0"))
            }
            
            it("Should validate sorting option value for Distance option") {
                self.subject.sortingOptionTypeSelected = .Distance
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5"))
            }
            
            it("Should validate sorting option value for Popularity option") {
                self.subject.sortingOptionTypeSelected = .Popularity
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3.0"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5.0"))
            }
            
            it("Should validate sorting option value for Average Product Price option") {
                self.subject.sortingOptionTypeSelected = .AverageProductPrice
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5"))
            }
            
            it("Should validate sorting option value for Delivery Costs option") {
                self.subject.sortingOptionTypeSelected = .DeliveryCosts
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5"))
            }
            
            it("Should validate sorting option value for Min Cost option") {
                self.subject.sortingOptionTypeSelected = .MinCost
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 0))).to(equal("1"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 1))).to(equal("3"))
                expect(self.subject.getRestaurantSortingOptionValue(indexPath: IndexPath(row: 0, section: 2))).to(equal("5"))
            }
            
            // Sort Opening States Functions Validation
            it("Should validate should show opening state return when openingStateSelected = All") {
                self.subject.openingStateSelected = .All
                expect(self.subject.shouldShowOpeningState(.All)).to(beTrue())
                expect(self.subject.shouldShowOpeningState(.Open)).to(beTrue())
                expect(self.subject.shouldShowOpeningState(.OrderAhead)).to(beTrue())
                expect(self.subject.shouldShowOpeningState(.Closed)).to(beTrue())
            }
            
            it("Should validate should show opening state return when openingStateSelected = Open") {
                self.subject.openingStateSelected = .Open
                expect(self.subject.shouldShowOpeningState(.All)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.Open)).to(beTrue())
                expect(self.subject.shouldShowOpeningState(.OrderAhead)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.Closed)).to(beFalse())
            }
            
            it("Should validate should show opening state return when openingStateSelected = OrderAhead") {
                self.subject.openingStateSelected = .OrderAhead
                expect(self.subject.shouldShowOpeningState(.All)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.Open)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.OrderAhead)).to(beTrue())
                expect(self.subject.shouldShowOpeningState(.Closed)).to(beFalse())
            }
            
            it("Should validate should show opening state return when openingStateSelected = Closed") {
                self.subject.openingStateSelected = .Closed
                expect(self.subject.shouldShowOpeningState(.All)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.Open)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.OrderAhead)).to(beFalse())
                expect(self.subject.shouldShowOpeningState(.Closed)).to(beTrue())
            }
            
            // Picker View Info Functions Validation
            it("Should validate number of components in picker view") {
                expect(self.subject.getNumberOfComponentsInPickerView()).to(equal(1))
            }
            
            it("Should validate number of rows for picker views") {
                expect(self.subject.getNumberOfRowsInPickerView(selectionType: .OpeningStates)).to(equal(4))
                expect(self.subject.getNumberOfRowsInPickerView(selectionType: .Option)).to(equal(9))
                expect(self.subject.getNumberOfRowsInPickerView(selectionType: .Order)).to(equal(2))
            }
            
            it("Should validate title of rows for opening states picker view") {
                expect(self.subject.getTitleForRowInPickerView(.OpeningStates, forRow: 0)).to(equal("all"))
                expect(self.subject.getTitleForRowInPickerView(.OpeningStates, forRow: 1)).to(equal("open"))
                expect(self.subject.getTitleForRowInPickerView(.OpeningStates, forRow: 2)).to(equal("order ahead"))
                expect(self.subject.getTitleForRowInPickerView(.OpeningStates, forRow: 3)).to(equal("closed"))
            }
            
            it("Should validate title of rows for sorting option type picker view") {
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 0)).to(equal("Alphabetic"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 1)).to(equal("Best Match"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 2)).to(equal("Newest"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 3)).to(equal("Rating Average"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 4)).to(equal("Distance"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 5)).to(equal("Popularity"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 6)).to(equal("Average Product Price"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 7)).to(equal("Delivery Costs"))
                expect(self.subject.getTitleForRowInPickerView(.Option, forRow: 8)).to(equal("Min Cost"))
            }
            
            it("Should validate title of rows for sorting order type picker view") {
                expect(self.subject.getTitleForRowInPickerView(.Order, forRow: 0)).to(equal("Ascending"))
                expect(self.subject.getTitleForRowInPickerView(.Order, forRow: 1)).to(equal("Descending"))
            }
            
            it("Should validate title text of picker views") {
                expect(self.subject.getPickerViewTitleText(.OpeningStates)).to(equal("Change opening state"))
                expect(self.subject.getPickerViewTitleText(.Option)).to(equal("Change sorting option type"))
                expect(self.subject.getPickerViewTitleText(.Order)).to(equal("Change sorting order type"))
            }
            
            it("Should validate title text of picker views") {
                expect(self.subject.getAlertDefaultButtonText()).to(equal("Ok"))
            }
            
            // Sort by Option Values and Order Functions Validation
            it("Should validate sort by Alphabetic option, Ascending") {
                self.subject.sortByOption(.Alphabetic, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].name).to(equal("Restaurant1"))
                expect(self.subject.restaurantListOrderAhead[0].name).to(equal("Restaurant3"))
                expect(self.subject.restaurantListClosed[0].name).to(equal("Restaurant5"))
            }
            
            it("Should validate sort by Alphabetic option, Descending") {
                self.subject.sortByOption(.Alphabetic, order: .Descending)
                expect(self.subject.restaurantListOpen[0].name).to(equal("Restaurant2"))
                expect(self.subject.restaurantListOrderAhead[0].name).to(equal("Restaurant4"))
                expect(self.subject.restaurantListClosed[0].name).to(equal("Restaurant6"))
            }
            
            it("Should validate sort by Best Match option, Ascending") {
                self.subject.sortByOption(.BestMatch, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.bestMatch).to(equal(1.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.bestMatch).to(equal(3.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.bestMatch).to(equal(5.0))
            }
            
            it("Should validate sort by Best Match option, Descending") {
                self.subject.sortByOption(.BestMatch, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.bestMatch).to(equal(2.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.bestMatch).to(equal(4.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.bestMatch).to(equal(6.0))
            }
            
            it("Should validate sort by Newest option, Ascending") {
                self.subject.sortByOption(.Newest, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.newest).to(equal(1.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.newest).to(equal(3.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.newest).to(equal(5.0))
            }
            
            it("Should validate sort by Newest option, Descending") {
                self.subject.sortByOption(.Newest, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.newest).to(equal(2.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.newest).to(equal(4.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.newest).to(equal(6.0))
            }
            
            it("Should validate sort by Rating Average option, Ascending") {
                self.subject.sortByOption(.RatingAverage, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.ratingAverage).to(equal(1.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.ratingAverage).to(equal(3.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.ratingAverage).to(equal(5.0))
            }
            
            it("Should validate sort by Rating Average option, Descending") {
                self.subject.sortByOption(.RatingAverage, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.ratingAverage).to(equal(2.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.ratingAverage).to(equal(4.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.ratingAverage).to(equal(6.0))
            }
            
            it("Should validate sort by Distance option, Ascending") {
                self.subject.sortByOption(.Distance, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.distance).to(equal(1))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.distance).to(equal(3))
                expect(self.subject.restaurantListClosed[0].sortingValues.distance).to(equal(5))
            }
            
            it("Should validate sort by Distance option, Descending") {
                self.subject.sortByOption(.Distance, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.distance).to(equal(2))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.distance).to(equal(4))
                expect(self.subject.restaurantListClosed[0].sortingValues.distance).to(equal(6))
            }
            
            it("Should validate sort by Popularity option, Ascending") {
                self.subject.sortByOption(.Popularity, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.popularity).to(equal(1.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.popularity).to(equal(3.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.popularity).to(equal(5.0))
            }
            
            it("Should validate sort by Popularity option, Descending") {
                self.subject.sortByOption(.Popularity, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.popularity).to(equal(2.0))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.popularity).to(equal(4.0))
                expect(self.subject.restaurantListClosed[0].sortingValues.popularity).to(equal(6.0))
            }
            
            it("Should validate sort by Average Product Price option, Ascending") {
                self.subject.sortByOption(.AverageProductPrice, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.averageProductPrice).to(equal(1))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.averageProductPrice).to(equal(3))
                expect(self.subject.restaurantListClosed[0].sortingValues.averageProductPrice).to(equal(5))
            }
            
            it("Should validate sort by Average Product Price option, Descending") {
                self.subject.sortByOption(.AverageProductPrice, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.averageProductPrice).to(equal(2))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.averageProductPrice).to(equal(4))
                expect(self.subject.restaurantListClosed[0].sortingValues.averageProductPrice).to(equal(6))
            }
            
            it("Should validate sort by Delivery Costs option, Ascending") {
                self.subject.sortByOption(.DeliveryCosts, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.deliveryCosts).to(equal(1))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.deliveryCosts).to(equal(3))
                expect(self.subject.restaurantListClosed[0].sortingValues.deliveryCosts).to(equal(5))
            }
            
            it("Should validate sort by Delivery Costs option, Descending") {
                self.subject.sortByOption(.DeliveryCosts, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.deliveryCosts).to(equal(2))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.deliveryCosts).to(equal(4))
                expect(self.subject.restaurantListClosed[0].sortingValues.deliveryCosts).to(equal(6))
            }
            
            it("Should validate sort by Min Cost option, Ascending") {
                self.subject.sortByOption(.MinCost, order: .Ascending)
                expect(self.subject.restaurantListOpen[0].sortingValues.minCost).to(equal(1))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.minCost).to(equal(3))
                expect(self.subject.restaurantListClosed[0].sortingValues.minCost).to(equal(5))
            }
            
            it("Should validate sort by Min Cost option, Descending") {
                self.subject.sortByOption(.MinCost, order: .Descending)
                expect(self.subject.restaurantListOpen[0].sortingValues.minCost).to(equal(2))
                expect(self.subject.restaurantListOrderAhead[0].sortingValues.minCost).to(equal(4))
                expect(self.subject.restaurantListClosed[0].sortingValues.minCost).to(equal(6))
            }
            
            // Change Sorting Type Selection
            it("Should validate changes on opening state") {
                self.subject.didChangeOpeningState(selectedRow: 0)
                expect(self.subject.openingStateSelected).to(equal(.All))
                
                self.subject.didChangeOpeningState(selectedRow: 1)
                expect(self.subject.openingStateSelected).to(equal(.Open))
                
                self.subject.didChangeOpeningState(selectedRow: 2)
                expect(self.subject.openingStateSelected).to(equal(.OrderAhead))
                
                self.subject.didChangeOpeningState(selectedRow: 3)
                expect(self.subject.openingStateSelected).to(equal(.Closed))
            }
            
            it("Should validate changes on sorting option type") {
                self.subject.didChangeOptionType(selectedRow: 0)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.Alphabetic))
                
                self.subject.didChangeOptionType(selectedRow: 1)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.BestMatch))
                
                self.subject.didChangeOptionType(selectedRow: 2)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.Newest))
                
                self.subject.didChangeOptionType(selectedRow: 3)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.RatingAverage))
                
                self.subject.didChangeOptionType(selectedRow: 4)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.Distance))
                
                self.subject.didChangeOptionType(selectedRow: 5)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.Popularity))
                
                self.subject.didChangeOptionType(selectedRow: 6)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.AverageProductPrice))
                
                self.subject.didChangeOptionType(selectedRow: 7)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.DeliveryCosts))
                
                self.subject.didChangeOptionType(selectedRow: 8)
                expect(self.subject.sortingOptionTypeSelected).to(equal(.MinCost))
            }
            
            it("Should validate changes on sorting order type") {
                self.subject.didChangeOrderType(selectedRow: 0)
                expect(self.subject.sortingOrderTypeSelected).to(equal(.Ascending))
                
                self.subject.didChangeOrderType(selectedRow: 1)
                expect(self.subject.sortingOrderTypeSelected).to(equal(.Descending))
            }
        }
    }
}
