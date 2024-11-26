//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Vanshika Choudhary on 26/11/24.
//

import UIKit

protocol EmployeeTypeTableViewControllerDelegate: AnyObject {
    func employeeTypeTableViewController(
        _ controller: EmployeeTypeTableViewController,
        didSelect employeeType: EmployeeType
    )
}

class EmployeeTypeTableViewController: UITableViewController {

    var employeeType: EmployeeType?
    weak var delegate: EmployeeTypeTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Employee Type"
    }
    
    // MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmployeeType.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)
        let type = EmployeeType.allCases[indexPath.row]
        
        // Configure the cell
        var content = cell.defaultContentConfiguration()
        content.text = type.description
        cell.contentConfiguration = content
        
        // Add a checkmark if this type is selected
        if employeeType == type {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = EmployeeType.allCases[indexPath.row]
        employeeType = type
        delegate?.employeeTypeTableViewController(self, didSelect: type)
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
