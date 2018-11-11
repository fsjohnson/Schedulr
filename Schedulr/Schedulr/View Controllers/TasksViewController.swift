//
//  TasksViewController.swift
//  Schedulr
//
//  Created by Felicity Johnson on 10/24/18.
//  Copyright © 2018 FJ. All rights reserved.
//

import UIKit
import SnapKit

private struct Layout {
    static let imageViewMultiplier: CGFloat = 0.2
    static let tableViewOffset: CGFloat = 20
    static let imageSize: CGSize = CGSize(width: 90, height: 90)
}

class TasksViewController: UIViewController {
    
    // Private properties
    private let logoImage = UIImageView()
    private let itemTableVC = ItemTableViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpVC()
    }
    
    // MARK: - Private functions
    private func setUpVC() {
        view.backgroundColor = .white
        
        logoImage.image = #imageLiteral(resourceName: "logo")
        
        view.addSubview(logoImage)
        logoImage.snp.makeConstraints { make in
            make.size.equalTo(Layout.imageSize)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().multipliedBy(Layout.imageViewMultiplier)
        }
        
        addChildViewController(itemTableVC)
        view.addSubview(itemTableVC.view)
        itemTableVC.view.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(Layout.tableViewOffset)
        }

        itemTableVC.didMove(toParentViewController: self)
    }
}
