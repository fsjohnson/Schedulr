//
//  ItemCellTableViewCell.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/21/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit
import SnapKit

private struct Layout {
    static let labelOffset: CGFloat = 10
    static let minCellHeight: CGFloat = 40
    static let fontSize: CGFloat = 12
    static let imageSize: CGSize = CGSize(width: 18, height: 18)
}

class ItemCellTableViewCell: UITableViewCell {
    
    // Public properties
    var task: Task
    
    // Private properties
    private let timeLabel = UILabel()
    private let taskLabel = UILabel()
    private let checkButton = UIButton()
    
    // Init
    init(task: Task) {
        self.task = task

        super.init(style: .default, reuseIdentifier: "ItemCellTableViewCell")
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Private functions
    private func setUpCell() {
        timeLabel.text = task.selectedTime.setUpTime(with: "HH:mm")
        timeLabel.textAlignment = .center
        
        let taskDetails = task.taskDetails ?? "Please input task details"
        taskLabel.text = taskDetails
        taskLabel.lineBreakMode = .byWordWrapping
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .left
        
        // TODO make extension with font & color stuff
        timeLabel.font = UIFont.boldSystemFont(ofSize: Layout.fontSize)
        taskLabel.font = UIFont.boldSystemFont(ofSize: Layout.fontSize)
        
        updateButtonImageAndBackgroundColor(with: task.state)
        checkButton.addTarget(self, action: #selector(checkedButtonAction), for: .touchUpInside)
        
        addSubview(timeLabel)
        addSubview(taskLabel)
        addSubview(checkButton)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.centerY.equalToSuperview()
            make.height.equalTo(timeLabel)
        }
        
        taskLabel.snp.makeConstraints { make in
            let minHeight: ConstraintRelatableTarget = Layout.minCellHeight
            make.height.greaterThanOrEqualTo(minHeight)
            make.leading.equalTo(timeLabel.snp.trailing).offset(Layout.labelOffset)
            make.top.bottom.centerY.equalToSuperview()
        }
        
        checkButton.snp.makeConstraints { make in
            make.leading.equalTo(taskLabel.snp.trailing).offset(Layout.labelOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
            make.size.equalTo(Layout.imageSize)
        }
    }
    
    @objc private func checkedButtonAction() {
        // If task.state is checked, set it to unchecked & vice versa
        guard task.state == .checked else {
            task.state = .checked
            updateButtonImageAndBackgroundColor(with: task.state)
            return
        }
        
        task.state = .notChecked
        updateButtonImageAndBackgroundColor(with: task.state)
    }
    
    private func updateButtonImageAndBackgroundColor(with state: State) {
        let buttonImage = state == .checked ? #imageLiteral(resourceName: "checkedBox") : #imageLiteral(resourceName: "uncheckedBox")
        checkButton.setImage(buttonImage, for: .normal)
        // TODO - get a better gray color
        backgroundColor = state == .checked ? .lightGray : .white
    }
}
