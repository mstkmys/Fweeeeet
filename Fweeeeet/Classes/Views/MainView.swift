//
//  MainView.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/25.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public var tablelView: UITableView = {
        let tableView = UITableView()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [tablelView].forEach{ self.addSubview($0) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        tablelView.anchor(
            top: self.safeAreaLayoutGuide.topAnchor,
            leading: self.leadingAnchor,
            bottom: self.safeAreaLayoutGuide.bottomAnchor,
            trailing: self.trailingAnchor
        )
    }
    
}































