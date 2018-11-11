//
//  NewTaskViewModel.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/30/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import Foundation
import UIKit

enum NewTaskCells {
    case date, startTime, endTime
    
    var title: String {
        switch self {
        case .date: return "Date"
        case .startTime: return "Start Time"
        case .endTime: return "End Time"
        }
    }
}

class NewTaskViewModel {
    
    var rows: [NewTaskCells] = [.date, .startTime, .endTime]
    
    func cellForRow(at indexPath: IndexPath) -> UITableViewCell {
        let cell = DatePickerTableViewCell(style: .default, reuseIdentifier: "DatePickerTableViewCell")
        
        let row = rows[indexPath.row]
        cell.titleText = row.title
        return cell
    }
}
