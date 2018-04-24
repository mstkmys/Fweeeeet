//
//  ViewController.swift
//  Fweeeeet
//
//  Created by Miyoshi Masataka on 2018/04/24.
//  Copyright © 2018年 Masataka Miyoshi. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    private var mainView: MainView = {
        let view = MainView(frame: UIScreen.main.bounds)
        view.backgroundColor = .white
        return view
    }()
    
    private var tableView: UITableView {
        return mainView.tablelView
    }
    
    private var db: Firestore!
    
    private var fweeeeetArray = [Fweeeeet]() {
        didSet {
            updateUI()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        db = Firestore.firestore()
        loadData()
        [mainView].forEach{ self.view.addSubview($0) }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Fweeeeet"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
    }
    
    private func updateUI() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func loadData() {
        db.collection("fweeeeets").getDocuments { querySnapshot, error in
            if let error = error {
                print("Error loading data: \(error.localizedDescription)")
            } else {
                self.fweeeeetArray = querySnapshot!.documents.compactMap({ Fweeeeet(dictonary: $0.data()) })
            }
        }
    }
    
    @objc private func addButtonTapped() {
        let alert = UIAlertController(title: "New", message: "Enter your message", preferredStyle: .alert)
        alert.addTextField { textFiled in
            textFiled.placeholder = "name"
        }
        alert.addTextField { textField in
            textField.placeholder = "message"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Send", style: .default, handler: { action in
            if let name = alert.textFields?.first?.text, let content = alert.textFields?.last?.text {
                let newFweeeeet = Fweeeeet(name: name, content: content, timeStamp: Date())
                var ref: DocumentReference? = nil
                ref = self.db.collection("fweeeeets").addDocument(data: newFweeeeet.dictonary) { error in
                    if let error = error {
                        print("Error adding database: \(error.localizedDescription)")
                    } else {
                        print("Document added with ID: \(String(describing: ref?.documentID))")
                    }
                }
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }

}

// MARK: - UITableViewDataSource
/*******************************************************************************************/
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fweeeeetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath) as! MyTableViewCell
        let fweeeeet = fweeeeetArray[indexPath.row]
        cell.nameLabel.text = fweeeeet.name
        cell.dateLabel.text = String(describing: fweeeeet.timeStamp)
        cell.titleLabel.text = fweeeeet.content
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























