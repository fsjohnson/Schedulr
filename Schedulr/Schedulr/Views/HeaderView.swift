//
//  HeaderView.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/24/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit
import SnapKit

private struct Layout {
    static let labelOffset: CGFloat = 10
    static let fontSize: CGFloat = 18
    static let borderLineHeight: CGFloat = 2
}

class HeaderView: UIView {

    // Public Properties
    let dateText: String
    
    // Private Properties
    private let dateLabel = UILabel()
    
    init(dateText: String) {
        self.dateText = dateText
        super.init(frame: .zero)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpView() {
        
        // TODO make extension with font stuff
        dateLabel.font = UIFont.italicSystemFont(ofSize: Layout.fontSize)
        dateLabel.textAlignment = .left
        dateLabel.text = dateText
        
        addSubview(dateLabel)
        addBorder(to: .bottom)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(Layout.labelOffset)
            make.top.bottom.trailing.equalToSuperview()
        }
    }

}
