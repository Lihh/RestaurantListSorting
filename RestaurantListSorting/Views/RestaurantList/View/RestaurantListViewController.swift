//
//  ViewController.swift
//  RestaurantListSorting
//
//  Created by Lidia Chou on 06/04/22.
//

import UIKit

class RestaurantListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var openingStateSelectedLabel: UILabel!
    @IBOutlet weak var openingStateSelectionButton: UIButton!
    @IBOutlet weak var sortingOptionSelectedLabel: UILabel!
    @IBOutlet weak var sortingOptionSelectionButton: UIButton!
    @IBOutlet weak var sortingOrderSelectionButton: UIButton!
    @IBOutlet weak var restaurantListTableView: UITableView!
    
    // MARK: - Properties
    var viewModel = RestaurantListViewModel()
    lazy var openingStateSelectionPickerView = UIPickerView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width - 20, height: 180))
    lazy var sortingOptionSelectionPickerView = UIPickerView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width - 20, height: 180))
    lazy var sortingOrderSelectionPickerView = UIPickerView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width - 20, height: 180))
    let cellHeightDefaultValue: CGFloat = 60
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableViewDelegates()
        setPickerViewDelegates()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.loadRestaurantList()
        setupView()
    }
    
    // MARK: - Actions
    @IBAction func didTapChangeOpeningStateSelectionButton(_ sender: Any) {
        let pickerViewTitle = viewModel.getPickerViewTitleText(.OpeningStates)
        let alertActionDefault = UIAlertAction(title: viewModel.getAlertDefaultButtonText(), style: .default, handler: nil)
        getAlertWithPickerView(title: pickerViewTitle, pickerView: openingStateSelectionPickerView, alertActionsArray: [alertActionDefault])
    }
    
    @IBAction func didTapChangeOptionTypeSelectionButton(_ sender: Any) {
        let pickerViewTitle = viewModel.getPickerViewTitleText(.Option)
        let alertActionDefault = UIAlertAction(title: viewModel.getAlertDefaultButtonText(), style: .default, handler: nil)
        getAlertWithPickerView(title: pickerViewTitle, pickerView: sortingOptionSelectionPickerView, alertActionsArray: [alertActionDefault])
    }
    
    @IBAction func didTapChangeOrderTypeSelectionButton(_ sender: Any) {
        let pickerViewTitle = viewModel.getPickerViewTitleText(.Order)
        let alertActionDefault = UIAlertAction(title: viewModel.getAlertDefaultButtonText(), style: .default, handler: nil)
        getAlertWithPickerView(title: pickerViewTitle, pickerView: sortingOrderSelectionPickerView, alertActionsArray: [alertActionDefault])
    }
    
    // MARK: - Public Functions
    func setupView() {
        viewModel.updateInfo()
        restaurantListTableView.reloadData()
        
        titleLabel.text = viewModel.getTitleText()
        
        openingStateSelectedLabel.text = viewModel.getOpeningStateSelectedText()
        openingStateSelectionButton.setTitle(viewModel.getOpeningStateSelectionButtonText(), for: .normal)
        
        sortingOptionSelectedLabel.text = viewModel.getSortingOptionSelectedText()
        sortingOptionSelectionButton.setTitle(viewModel.getSortingOptionSelectionButtonText(), for: .normal)
        sortingOrderSelectionButton.setTitle(viewModel.getSortingOrderSelectionButtonText(), for: .normal)
        
        setupAccessibility()
    }
    
    // MARK: - Private Functions
    private func getAlertWithPickerView(title: String, pickerView: UIPickerView, alertActionsArray: [UIAlertAction]) {
        let alert = UIAlertController(title: title, message: "\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
        alert.view.addSubview(pickerView)
        for action in alertActionsArray {
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setupAccessibility() {
        titleLabel.setAccessibility(id: "restaurant_list_view_title_label", label: titleLabel.text, enabled: true)
        
        openingStateSelectedLabel.setAccessibility(id: "restaurant_list_opening_state_selected_label", label: nil, enabled: false)
        openingStateSelectionButton.setAccessibility(id: "restaurant_list_opening_state_selection_button", label: "\(openingStateSelectedLabel.text ?? "") \(openingStateSelectionButton.titleLabel?.text ?? "")", enabled: true)
        openingStateSelectionButton.setAccessibilityHint(viewModel.getOpeningStateSelectionButtonAccessibilityHint())
        
        sortingOptionSelectedLabel.setAccessibility(id: "restaurant_list_sorting_opt_selected_label", label: nil, enabled: false)
        sortingOptionSelectionButton.setAccessibility(id: "restaurant_list_sorting_opt_selection_button", label: "\(sortingOptionSelectedLabel.text ?? "") \(sortingOptionSelectionButton.titleLabel?.text ?? "")", enabled: true)
        sortingOptionSelectionButton.setAccessibilityHint(viewModel.getSortingOptionSelectionButtonAccessibilityHint())
        
        sortingOrderSelectionButton.setAccessibility(id: "restaurant_list_sorting_order_selection_button", label: sortingOrderSelectionButton.titleLabel?.text, enabled: true)
        sortingOrderSelectionButton.setAccessibilityHint(viewModel.getSortingOrderSelectionButtonAccessibilityHint())
    }
}

