//
//  UIViewControler+Ext.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 18.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentAlertWithOk(title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
}
