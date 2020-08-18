//
//  AppointmentsVC.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 17.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class AppointmentsVC: UIViewController {
    
    let tableView = UITableView()
    
    var appointments: [Appointment]? {
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
        view.backgroundColor = .purple
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchAppointments()
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
        
        tableView.register(AppointmentCell.self, forCellReuseIdentifier: AppointmentCell.reuseID)
    }
    
    
    private func fetchAppointments() {
        FirestoreManager.fetchAppointments { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let appointments):
                self.appointments = appointments
                
            case .failure(let error):
                self.presentAlertWithOk(title: "Error", message: error.localizedDescription)
                
            }
        }
    }
    
}

extension AppointmentsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appointments?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentCell.reuseID, for: indexPath) as! AppointmentCell
        if let appointments = appointments {
            cell.set(appointment: appointments[indexPath.row])
        }
        return cell
    }
    
    
}
