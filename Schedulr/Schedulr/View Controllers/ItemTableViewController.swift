//
//  ItemTableViewController.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/21/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit

private struct Layout {
    static let headerHight: CGFloat = 44
}

class ItemTableViewController: UITableViewController {
    
    // Public properties
    // TODO: - set to array from core data, just using the below to test
    private let task = Task(state: .notChecked, selectedTime: Date(), taskDetails: "tasks and stuff and more stuff stuff stuff")
    private var tasks: [Task] {
        // TODO: I guess eventually use a get set & get from core data...
        return [task]
    }
    
    // TODO: remove this?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // TODO - think about this...each date is a section?
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO - fix to tasks.count
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCellTableViewCell", for: indexPath) as! ItemCellTableViewCell
        
        let task = tasks[indexPath.row]
        return ItemCellTableViewCell(task: task)
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Layout.headerHight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let task = tasks[section]
        let dateText = task.selectedTime.setUpTime(with: "EEEE, MMM d")
        return HeaderView(dateText: dateText)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present(NewTaskTableViewController(), animated: false, completion: nil)
    }
    
}
