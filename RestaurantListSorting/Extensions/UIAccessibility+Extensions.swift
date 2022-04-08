//
//  UIAccessibility+Extensions.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 07/04/22.
//

import UIKit

extension UIView {
    
    func setAccessibility(id: String?, label: String?, enabled: Bool) {
        accessibilityIdentifier = id
        accessibilityLabel = label
        isAccessibilityElement = enabled
    }
    
    func setAccessibilityHint(_ hint: String) {
        accessibilityHint = hint
    }
}
