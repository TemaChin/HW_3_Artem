//
//  FriendsExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData
import RealmSwift

extension FriendsViewController: OutputView {
    
    func output(_ data: Any?, identifier: String) {
        if identifier == String(describing: AddFriendViewController.self) {
            if let data = data as? MyFriendProfile {
                self.dataModel.append(data)
                self.friendsTableView.reloadData()
            }
        }
    }
    func addFriendButtonSetup() {
        addFriendButton.Setup()
        addFriendButton.setTitle("add", for: .normal)
        addFriendButton.addTarget(self, action: #selector(addFriendButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        addFriendButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
                                        addFriendButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                                        addFriendButton.widthAnchor.constraint(equalToConstant: 50),
                                        addFriendButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func FriendsBackButtonSetup() {
        FriendsBackButton.Setup()
        FriendsBackButton.setTitle("back", for: .normal)
        FriendsBackButton.addTarget(self, action: #selector(FriendsBackButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                    FriendsBackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                    FriendsBackButton.topAnchor.constraint(equalTo: addFriendButton.topAnchor),
                                    FriendsBackButton.widthAnchor.constraint(equalToConstant: 50),
                                    FriendsBackButton.heightAnchor.constraint(equalToConstant: 50)])
    }

    func requestDataCoreData() {
        self.dataModel = [MyFriendProfile]()
        let request = NSFetchRequest<NSManagedObject>(entityName: "Friend")
        if let context = StoreManager.shared.context {
            do {
                let result = try context.fetch(request)
                for item in result {
                    if let friend = item as? Friend {
                        let friendItem = MyFriendProfile(friend.name ?? "_", friend.city ?? "_")
                        dataModel.append(friendItem)
                    }
                }
                self.friendsTableView.reloadData()
            } catch {
                
            }
        }
    }
    
    func requestDataRealm() {
        self.dataModel = [MyFriendProfile]()
        guard let realm = try? Realm() else {return}
        self.friendArray = realm.objects(MyFriendProfileRealm.self)
        for item in friendArray! {
            let friendItem = MyFriendProfile(item.friendName , item.friendCity )
            dataModel.append(friendItem)
        }
        self.friendsTableView.reloadData()
    }

}

extension String {
    func changeVC(_ storyboard: String = "Main")->UIViewController? {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: self)
        return vc
    }
}
