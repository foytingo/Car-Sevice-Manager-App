//
//  CSATabBarController.swift
//  Car Sevice Manager App
//
//  Created by Murat Baykor on 17.08.2020.
//  Copyright © 2020 Murat Baykor. All rights reserved.
//

import UIKit

class CSATabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTabBar()
        viewControllers = [createUsersNC(), createCarsNC(), createAppointmentNC()]
        
    }
    
    
    private func createUsersNC() -> UINavigationController {
        let usersVC = UsersVC()
        usersVC.title = "Users"
        usersVC.tabBarItem = UITabBarItem(title: "Users", image: UIImage(systemName: "person"), tag: 0)
        
        return UINavigationController(rootViewController: usersVC)
    }
    
    private func createCarsNC() -> UINavigationController {
        let carsVC = CarsVC()
        carsVC.title = "Cars"
        carsVC.tabBarItem = UITabBarItem(title: "Cars", image: UIImage(systemName: "car"), tag: 1)
        
        return UINavigationController(rootViewController: carsVC)
    }
    
    private func createAppointmentNC() -> UINavigationController {
        let appointmentVC = AppointmentsVC()
        appointmentVC.title = "Appointments"
        appointmentVC.tabBarItem = UITabBarItem(title: "Appointments", image: UIImage(systemName: "calendar"), tag: 2)
        
        return UINavigationController(rootViewController: appointmentVC)
    }
    
    func configureNavigationBar() {
        UINavigationBar.appearance().tintColor = Colors.darkBlue
        UINavigationBar.appearance().barTintColor = Colors.softBlue
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: Colors.darkBlue]
    }
    
    private func configureTabBar() {
        UITabBar.appearance().tintColor = Colors.darkBlue
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = Colors.softBlue
        UITabBar.appearance().unselectedItemTintColor = .darkGray
    }
}
