//
//  NewTaskViewController.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/30/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import Foundation
import SnapKit

private struct Layout {
    static let labelOffset: CGFloat = 10
    static let topOffset: CGFloat = 3
    static let fontSize: CGFloat = 18
    static let borderLineHeight: CGFloat = 2
}

class NewTaskViewController: UIViewController {
    
    // Private Properties
    private let dateLabel = UILabel()
    private let datePicker = UIDatePicker()
    private let startTimeLabel = UILabel()
    private let startTimePickerView = UIDatePicker()
    private let endTimeLabel = UILabel()
    private let endTimePickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpVC()
    }
    
    // MARK: - Private functions 
    private func setUpVC() {
        
        view.backgroundColor = .white
        
        dateLabel.text = "Date"
        dateLabel.font = UIFont.italicSystemFont(ofSize: Layout.fontSize)
        dateLabel.textAlignment = .left
        
        startTimeLabel.text = "Start Time"
        startTimeLabel.font = UIFont.italicSystemFont(ofSize: Layout.fontSize)
        startTimeLabel.textAlignment = .left
        
        startTimeLabel.text = "End Time"
        startTimeLabel.font = UIFont.italicSystemFont(ofSize: Layout.fontSize)
        startTimeLabel.textAlignment = .left
        
        view.addSubview(dateLabel)
        view.addSubview(datePicker)
        view.addSubview(startTimeLabel)
        view.addSubview(startTimePickerView)
        view.addSubview(endTimeLabel)
        view.addSubview(endTimePickerView)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.top.equalToSuperview()
            make.trailing.equalTo(datePicker.snp.leading).inset(Layout.labelOffset)
            make.bottom.equalTo(startTimeLabel.snp.top).inset(Layout.topOffset)
        }
        
        datePicker.snp.makeConstraints { make in
            make.top.bottom.equalTo(dateLabel)
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
        }
        
        startTimeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.trailing.equalTo(startTimePickerView.snp.leading).inset(Layout.labelOffset)
        }
        
        startTimePickerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(startTimeLabel)
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
        }
        
        endTimeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.trailing.equalTo(endTimePickerView.snp.leading).inset(Layout.labelOffset)
        }
        
        endTimePickerView.snp.makeConstraints { make in
            make.top.bottom.equalTo(endTimePickerView)
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
        }
    }
    
}

