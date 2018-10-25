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
    static let minCellHeight: CGFloat = 25
    static let fontSize: CGFloat = 12
    static let imageSize: CGSize = CGSize(width: 18, height: 18)
}

class ItemCellTableViewCell: UITableViewCell {
    
    private var task: Task
    private let timeLabel = UILabel()
    private let taskLabel = UILabel()
    // TODO: - change image to button
    private let checkedImageView = UIImageView()
    
    init(task: Task) {
        self.task = task

        super.init(style: .default, reuseIdentifier: "ItemCellTableViewCell")
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpCell() {
        timeLabel.text = task.selectedTime.setUpTime(with: "HH:mm")
        timeLabel.textAlignment = .center
        
        let taskDetails = task.taskDetails ?? "Please input task details"
        taskLabel.text = taskDetails
        taskLabel.lineBreakMode = .byWordWrapping
        taskLabel.numberOfLines = 0
        taskLabel.textAlignment = .left
        
        // TODO make extension with font stuff
        timeLabel.font = UIFont.boldSystemFont(ofSize: Layout.fontSize)
        taskLabel.font = UIFont.boldSystemFont(ofSize: Layout.fontSize)
        
        checkedImageView.image = task.state == .checked ? #imageLiteral(resourceName: "checkedBox") : #imageLiteral(resourceName: "uncheckedBox")
        
        addSubview(timeLabel)
        addSubview(taskLabel)
        addSubview(checkedImageView)
        
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
        
        checkedImageView.snp.makeConstraints { make in
            make.leading.equalTo(taskLabel.snp.trailing).offset(Layout.labelOffset)
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
            make.size.equalTo(Layout.imageSize)
        }
    }
}
