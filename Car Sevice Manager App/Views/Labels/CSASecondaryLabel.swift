//
//  CSASecondaryLabel.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class CSASecondaryLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        
        textColor = .secondaryLabel
        textAlignment = .left
        
        font = UIFont.systemFont(ofSize: 20, weight: .regular )
    }

}
