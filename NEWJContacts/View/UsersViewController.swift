//
//  UsersViewController.swift
//  NEWJContacts
//
//  Created by mmt on 27/07/21.
//

import UIKit

class UsersViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    var usersViewModel : UsersViewModel?

    @IBOutlet weak var userTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        cosmeticUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        usersViewModel?.fetchUsers()
        usersViewModel?.users.bind { [weak self] arr in
            self?.userTableView.reloadData()
        }
    }
}


extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        usersViewModel?.getUsers().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.historyTableViewCell, for: indexPath) as? UserTableViewCell {
            if usersViewModel?.getUsers().count ?? 0 > indexPath.row, let user = usersViewModel?.users.value[indexPath.row] {
                cell.configureCell(user: user)
                return cell
            }
        }
        return UserTableViewCell.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if usersViewModel?.users.value.count ?? 0 > indexPath.row, let user = usersViewModel?.users.value[indexPath.row] {
            coordinator?.showDetails(id: Int(user.id))
        }
        
    }
}

extension UsersViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}

extension UIViewController {
    func cosmeticUI()  {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.startPoint = CGPoint.init(x: 0, y: 0)
        gradient.endPoint = CGPoint.init(x: 1, y: 1)
        gradient.colors = [Constants.Colors.blueColor.cgColor, Constants.Colors.darkBlueColor.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
}
