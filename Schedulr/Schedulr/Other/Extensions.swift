//
//  Extensions.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/24/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

extension Date {
    
    func setUpTime(with selectedFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = selectedFormat
        let timeString = formatter.string(from: self)
        return timeString
    }
}

private struct Layout {
    static let labelOffset: CGFloat = 10
    static let fontSize: CGFloat = 18
    static let borderLineHeight: CGFloat = 2
}

extension UIView {
    
    enum Border {
        case top, bottom, left, right
    }
    
    func addBorder(to border: Border) {
        let borderLine = UIView()
        borderLine.backgroundColor = .black
        self.addSubview(borderLine)
        
        borderLine.snp.makeConstraints { make in
            
            switch border {
            case .bottom:
                make.width.bottom.equalToSuperview()
                make.height.equalTo(Layout.borderLineHeight)
            case .left:
                make.leading.top.bottom.equalToSuperview()
                make.width.equalTo(Layout.borderLineHeight)
            case .right:
                make.trailing.top.bottom.equalToSuperview()
                make.width.equalTo(Layout.borderLineHeight)
            case .top:
                make.width.top.equalToSuperview()
                make.height.equalTo(Layout.borderLineHeight)
            }
        }
    }
}
