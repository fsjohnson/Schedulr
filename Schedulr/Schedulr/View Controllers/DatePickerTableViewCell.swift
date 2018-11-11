//
//  DatePickerTableViewCell.swift
//  Schedulr
//
//  Created by Felicity Johnson on 11/2/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit
import SnapKit

private struct Layout {
    static let labelOffset: CGFloat = 10
    static let cellHeight: CGFloat = 40
    static let expandedCellHeight: CGFloat = 140
    static let fontSize: CGFloat = 12
    static let imageSize: CGSize = CGSize(width: 18, height: 18)
}

class DatePickerTableViewCell: UITableViewCell {
    
    // Public properties
    var titleText: String? {
        didSet {
            guard let text = titleText else { return }
            titleLabel.text = text
        }
    }
    
    var isCollapsed: Bool = true {
        didSet {
            if isCollapsed == false {
                titleLabel.snp.updateConstraints { update in
                    update.height.equalTo(Layout.expandedCellHeight)
                }
            } else {
                titleLabel.snp.updateConstraints { update in
                    update.height.equalTo(Layout.cellHeight)
                }
            }
            
        }
    }
    
    // Private properties
    private let titleLabel = UILabel()
    private let datePicker = UIDatePicker()
    
    // Init
    init(style: UITableViewCellStyle, reuseIdentifier: String) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    private func setUpCell() {
        isUserInteractionEnabled = true
        
        titleLabel.textAlignment = .left
       
        // TODO make extension with font & color stuff
        titleLabel.font = UIFont.boldSystemFont(ofSize: Layout.fontSize)
        
        addSubview(titleLabel)
        addSubview(datePicker)
        
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.centerY.top.bottom.equalToSuperview()
            make.height.equalTo(Layout.cellHeight)
        }
        
        datePicker.snp.makeConstraints { make in
            make.leading.equalTo(titleLabel.snp.trailing).offset(Layout.labelOffset)
            make.top.bottom.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(Layout.labelOffset)
            make.height.equalTo(titleLabel)
        }
    }
}
