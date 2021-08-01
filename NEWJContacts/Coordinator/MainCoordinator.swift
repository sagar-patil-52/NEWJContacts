//
//  MainCoordinator.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.navigationBar.isHidden = true
    }

    func start() {
        let vc = UsersViewController.instantiate()
        vc.coordinator = self
        vc.usersViewModel = UsersViewModel()
        navigationController.pushViewController(vc, animated: false)
    }
    
    func showDetails(id : Int) {
        
        let detailsVC = ContactDetailsViewController.instantiate()
        detailsVC.userDetailViewModel = UserDetailViewModel.init(userId: id)
        navigationController.pushViewController(detailsVC, animated: true)
    }
}
