//
//  RestaurantListViewController+PickerView.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 07/04/22.
//

import UIKit

extension RestaurantListViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - Picker View Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return viewModel.getNumberOfComponentsInPickerView()
    }
     
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case openingStateSelectionPickerView:
            return viewModel.getNumberOfRowsInPickerView(selectionType: .OpeningStates)
        case sortingOptionSelectionPickerView:
            return viewModel.getNumberOfRowsInPickerView(selectionType: .Option)
        case sortingOrderSelectionPickerView:
            return viewModel.getNumberOfRowsInPickerView(selectionType: .Order)
        default: return 0
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView {
        case openingStateSelectionPickerView:
            return viewModel.getTitleForRowInPickerView(.OpeningStates, forRow: row)
        case sortingOptionSelectionPickerView:
            return viewModel.getTitleForRowInPickerView(.Option, forRow: row)
        case sortingOrderSelectionPickerView:
            return viewModel.getTitleForRowInPickerView(.Order, forRow: row)
        default: return ""
        }
    }
        
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case openingStateSelectionPickerView:
            viewModel.didChangeOpeningState(selectedRow: row)
        case sortingOptionSelectionPickerView:
            viewModel.didChangeOptionType(selectedRow: row)
        case sortingOrderSelectionPickerView:
            viewModel.didChangeOrderType(selectedRow: row)
        default: return
        }
        setupView()
    }
    
    // MARK: - Public Functions
    func setPickerViewDelegates() {
        openingStateSelectionPickerView.delegate = self
        openingStateSelectionPickerView.dataSource = self
        sortingOptionSelectionPickerView.delegate = self
        sortingOptionSelectionPickerView.dataSource = self
        sortingOrderSelectionPickerView.delegate = self
        sortingOrderSelectionPickerView.dataSource = self
    }
}
