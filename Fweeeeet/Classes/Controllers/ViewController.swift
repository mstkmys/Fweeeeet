//
//  ViewController.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/24.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var mainView: MainView {
        let view = MainView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        return view
    }
    
    private var tableView: UITableView {
        return mainView.tablelView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [mainView].forEach{ self.view.addSubview($0) }
    }

}
























