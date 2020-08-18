//
//  UsersVC.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 17.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class UsersVC: UIViewController {

    let tableView = UITableView()
    
    var users: [User]? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureTableView()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchUsers()
    }
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    

    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 100
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseID)
    }
    
    
    private func fetchUsers() {
        FirestoreManager.fetchUsers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users = users
            case .failure(let error):
                self.presentAlertWithOk(title: "Error", message: error.localizedDescription)
                
            }
        }
    }
    

}

extension UsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseID, for: indexPath) as! UserCell
        if let users = users {
            cell.set(user: users[indexPath.row])
        }
        return cell
    }
    
    
}
