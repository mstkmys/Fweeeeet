//
//  ViewController.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/24.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var mainView: MainView = {
        let view = MainView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        return view
    }()
    
    private var tableView: UITableView {
        return mainView.tablelView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        [mainView].forEach{ self.view.addSubview($0) }
        tableView.dataSource = self
        tableView.delegate = self
    }

}

// MARK: - UITableViewDataSource
/*******************************************************************************************/
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        cell.nameLabel.text = "名前"
        cell.dateLabel.text = String(describing: Date())
        cell.titleLabel.text = "ここにタイトルが入ります"
        return cell
    }
    
}

// MARK: - UITableViewDataDelegate
/*******************************************************************************************/
extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}























