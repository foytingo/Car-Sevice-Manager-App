//
//  UserCell.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    let nameLabel = CSATitleLabel()
    let uidLabel = CSAFootnoteLabel()
    let emailLabel = CSASecondaryLabel()
    let carCountLabel = CSASecondaryLabel()
    let appointmentCountLabel = CSASecondaryLabel()
        
    let stackViewVer1 = UIStackView()
    let stackViewVer2 = UIStackView()
    let stackViewHor = UIStackView()
    
    static let reuseID = "UserCell"
    
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
        stackViewVer1.addArrangedSubview(nameLabel)
        stackViewVer1.addArrangedSubview(emailLabel)
        stackViewVer1.addArrangedSubview(uidLabel)
        
        stackViewVer2.addArrangedSubview(carCountLabel)
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
            stackViewHor.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackViewHor.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    
    func set(user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        uidLabel.text = "OwnerID: \(user.uid!)"
        carCountLabel.text = "Cars: \(user.cars.count)"
        appointmentCountLabel.text = "Appointments: \(user.appointments.count)"
        
    }
    
}
