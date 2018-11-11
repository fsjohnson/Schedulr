//
//  Task.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/22/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit

enum State {
    case checked, notChecked
}

final class Task {
    var state: State = .notChecked
    var selectedTime = Date()
    var taskDetails: String?
    
    init(state: State, selectedTime: Date, taskDetails: String?) {
        self.state = state
        self.selectedTime = selectedTime
        self.taskDetails = taskDetails
    }
}
