//
//  NewTaskTableViewController.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/30/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit

private struct Layout {
    static let headerHight: CGFloat = 44
}

class NewTaskTableViewController: UITableViewController {
    
    // Private properties
    private let viewModel = NewTaskViewModel()
    private var datePickerIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 80.0
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.cellForRow(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.visibleCells[indexPath.row] as? DatePickerTableViewCell else { return }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let datePickerIndexPath = datePickerIndexPath, let previousCell = tableView.visibleCells[datePickerIndexPath.row] as? DatePickerTableViewCell, datePickerIndexPath.row != indexPath.row {
            previousCell.isCollapsed = true
        }
        
        updateDatePickerStatus(on: selectedCell)
        datePickerIndexPath = indexPath
    }
    
    // MARK: - Private functions
    private func updateDatePickerStatus(on selectedCell: DatePickerTableViewCell) {
        tableView.beginUpdates()
        
        if selectedCell.isCollapsed == false {
            selectedCell.isCollapsed = true
        } else {
            selectedCell.isCollapsed = false
        }
        
        tableView.endUpdates()
    }
}

