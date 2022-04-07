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
    }
}
