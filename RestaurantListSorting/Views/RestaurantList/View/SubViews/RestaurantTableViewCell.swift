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
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: - Public Functions
    func setRestaurantCell(name: String, openingState: String) {
        nameLabel.text = name
        openingStateLabel.text = openingState
    }
}
