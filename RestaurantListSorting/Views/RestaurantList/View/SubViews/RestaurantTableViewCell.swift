//
//  RestaurantTableViewCell.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var openingStateLabel: UILabel!
    @IBOutlet weak var sortingOptionDescriptionLabel: UILabel!
    @IBOutlet weak var sortingOptionValueLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Functions
    func setRestaurantCell(name: String, openingState: String, sortingOptionDescription: String?, sortingOptionValue: String?) {
        nameLabel.text = name
        openingStateLabel.text = openingState
        sortingOptionDescriptionLabel.text = sortingOptionDescription
        sortingOptionValueLabel.text = sortingOptionValue
        
        setupAccessibility()
    }
    
    // MARK: - Private Functions
    func setupAccessibility() {
        let hasSortingOptionDescription = sortingOptionDescriptionLabel.text != nil
        nameLabel.setAccessibility(id: "restaurant_cell_name_label", label: nameLabel.text, enabled: true)
        openingStateLabel.setAccessibility(id: "restaurant_cell_opening_state_label", label: "Opening state: \(openingStateLabel.text ?? "")", enabled: true)
        sortingOptionDescriptionLabel.setAccessibility(id: "restaurant_cell_sorting_opt_description_label", label: sortingOptionDescriptionLabel.text, enabled: hasSortingOptionDescription)
        sortingOptionValueLabel.setAccessibility(id: "restaurant_cell_sorting_opt_value_label", label: sortingOptionValueLabel.text, enabled: hasSortingOptionDescription)
    }
}
