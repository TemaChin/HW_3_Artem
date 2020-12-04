//
//  FriendsViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData
import RealmSwift

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var addFriendButton: MyButton = {
        return MyButton()
    }()
    lazy var FriendsBackButton: MyButton = {
        return MyButton()
    }()
    var dataModel = [MyFriendProfile]()
    lazy var realm = try? Realm()
    var token: NotificationToken?
    var friendArray: Results<MyFriendProfileRealm>? = nil

    @IBOutlet weak var friendsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cell = UINib(nibName: "FriendsCell", bundle: nil)
        self.friendsTableView.register(cell, forCellReuseIdentifier: "cell")

        view.addSubview(addFriendButton)
        addFriendButtonSetup()
        view.addSubview(FriendsBackButton)
        FriendsBackButtonSetup()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.friendsTableView.delegate = self
        self.friendsTableView.dataSource = self
//        self.requestDataCoreData()
        self.requestDataRealm()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataModel.count
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FriendsCell
            cell.friendsNameLabel?.text = dataModel[indexPath.row].name
            cell.friendsDetailLabel?.text = dataModel[indexPath.row].info

            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = dataModel[indexPath.row]
        if let viewController = String(describing: MyFriendViewController.self).viewController() as? MyFriendViewController {
            viewController.input(item)
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @ objc func addFriendButtonAction() {
        if let viewController = String(describing: AddFriendViewController.self).viewController() as? AddFriendViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
            viewController.listener = self
        }
        }
    
    @ objc func FriendsBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    deinit {
        self.token?.invalidate()
    }
    }
