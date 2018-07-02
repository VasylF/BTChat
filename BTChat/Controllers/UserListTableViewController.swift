//
//  ChatTableViewController.swift
//  BTChat
//
//  Created by Mac on 25.06.18.
//  Copyright © 2018 VasylFuchenko. All rights reserved.
//

import UIKit
import FBSDKLoginKit

protocol UserListTableViewControllerDelegate {
    func cellSelected(_ newUser: User)
}

var viewController: UISplitViewController!

class UserListTableViewController: UITableViewController {
    
    var delegate: UserListTableViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    static func createUsers() {
        ListOfUsers.shared.arrayOfUsers.append(User(id: "1", name: "Vasyl"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "2", name: "Yaroslav"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "3", name: "Oleg"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "4", name: "Ivan"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "5", name: "Volodya"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "6", name: "Ruslan"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "7", name: "Bodya"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "8", name: "Ira"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "9", name: "Nazar"))
        ListOfUsers.shared.arrayOfUsers.append(User(id: "10", name: "Dima"))
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListOfUsers.shared.arrayOfUsers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserListTableViewCell
        cell.userName.text = ListOfUsers.shared.arrayOfUsers[indexPath.row].name
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let chatVC = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as? ChatViewController,
        let splitVC = splitViewController else {return}
        
        let detailNavigationVC = UINavigationController(rootViewController: chatVC)
        splitVC.showDetailViewController(detailNavigationVC, sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

}


