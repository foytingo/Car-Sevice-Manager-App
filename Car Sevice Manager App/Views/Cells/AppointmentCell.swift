//
//  AppointmentCell.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class AppointmentCell: UITableViewCell {
    
    let appointmentIDLabel = CSAFootnoteLabel()
    let carIDLabel = CSAFootnoteLabel()
    let carOwnerIDLabel = CSAFootnoteLabel()
    let phoneNumberLabel = CSATitleLabel()
    let dateLabel = CSATitleLabel()
    
    let stackViewVer1 = UIStackView()
    let stackViewVer2 = UIStackView()
    let stackViewHor = UIStackView()
    
    static let reuseID = "AppointmentCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        configureVerticalStackViews()
        configureHorizontalStackView()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        accessoryType = .disclosureIndicator
    }
    
    
    private func configureVerticalStackViews() {
        stackViewVer1.addArrangedSubview(dateLabel)
        stackViewVer1.addArrangedSubview(phoneNumberLabel)
        
        stackViewVer2.addArrangedSubview(appointmentIDLabel)
        stackViewVer2.addArrangedSubview(carIDLabel)
        stackViewVer2.addArrangedSubview(carOwnerIDLabel)
        
        stackViewVer1.translatesAutoresizingMaskIntoConstraints = false
        stackViewVer2.translatesAutoresizingMaskIntoConstraints = false
        
        stackViewVer1.axis = .vertical
        stackViewVer1.distribution = .equalCentering
        
        stackViewVer2.axis = .vertical
        stackViewVer2.distribution = .equalCentering
    }
    
    private func configureHorizontalStackView() {
        addSubview(stackViewHor)
        stackViewHor.addArrangedSubview(stackViewVer1)
        stackViewHor.addArrangedSubview(stackViewVer2)
        
        stackViewHor.translatesAutoresizingMaskIntoConstraints = false
        stackViewHor.axis = .horizontal
        stackViewHor.distribution = .fillProportionally
        stackViewHor.spacing = 30
        
        stackViewHor.alignment = .center
        
        NSLayoutConstraint.activate([
            stackViewHor.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackViewHor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func set(appointment: Appointment) {
        dateLabel.text = appointment.date
        phoneNumberLabel.text = "Phone: \(appointment.phoneNumber)"
        appointmentIDLabel.text = "ID: \(appointment.uid.uuidString)"
        carOwnerIDLabel.text = "OwnerID: \(appointment.carOwner)"
        carIDLabel.text = "CarID: \(appointment.car)"
    }
}
