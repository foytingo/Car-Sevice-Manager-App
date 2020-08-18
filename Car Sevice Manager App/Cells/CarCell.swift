//
//  CarCell.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class CarCell: UITableViewCell {
    
    let carPlateLabel = CSATitleLabel()
    let carDetailLabel = CSASecondaryLabel()
    let carOwnerIDLabel = CSAFootnoteLabel()
    let carIDLabel = CSAFootnoteLabel()
    let currentKmLabel = CSASecondaryLabel()
    let appointmentCountLabel = CSASecondaryLabel()
    
    let stackViewVer1 = UIStackView()
    let stackViewVer2 = UIStackView()
    let stackViewHor = UIStackView()
    
    static let reuseID = "CarCell"
    
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
        stackViewVer1.addArrangedSubview(carPlateLabel)
        stackViewVer1.addArrangedSubview(carDetailLabel)
        stackViewVer1.addArrangedSubview(carOwnerIDLabel)
        stackViewVer1.addArrangedSubview(carIDLabel)
        
        stackViewVer2.addArrangedSubview(currentKmLabel)
        stackViewVer2.addArrangedSubview(appointmentCountLabel)
        
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
        stackViewHor.distribution = .fillEqually
        stackViewHor.spacing = 80
        
        stackViewHor.alignment = .center
        
        NSLayoutConstraint.activate([
            stackViewHor.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackViewHor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    
    func set(car: Car) {
        carPlateLabel.text = car.plateNumber
        carDetailLabel.text = "\(car.brand) - \(car.model) - \(car.year) - \(car.color)"
        carIDLabel.text = "CarID: \(car.uid)"
        carOwnerIDLabel.text = "OwnerID: \(car.owner)"
        currentKmLabel.text = "Current Km: \(car.currentKm)"
        appointmentCountLabel.text = "Appointments: \(car.appointments.count)"
    }
    
}
