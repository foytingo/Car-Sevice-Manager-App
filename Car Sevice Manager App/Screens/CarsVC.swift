//
//  CarsVC.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 17.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class CarsVC: CSALoadingVC {

    let tableView = UITableView()
    
    var cars: [Car]? {
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
        fetchCars()
    }
    
    
    private func configureView() {
        view.backgroundColor = .systemBackground
    }
    
    
    private func configureTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 130
        tableView.delegate      = self
        tableView.dataSource    = self
        
        tableView.register(CarCell.self, forCellReuseIdentifier: CarCell.reuseID)
    }
    
    
    private func fetchCars() {
        showLoadingView()
        FirestoreManager.fetchCars { [weak self] result in
            guard let self = self else { return }
            self.dismissLoadingView()
            switch result {
            case .success(let cars):
                self.cars = cars
                
            case .failure(let error):
                self.presentAlertWithOk(title: "Error", message: error.localizedDescription)
                
            }
        }
    }
    
}

extension CarsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarCell.reuseID, for: indexPath) as! CarCell
        if let cars = cars {
            cell.set(car: cars[indexPath.row])
        }
        return cell
    }
    
    
}
