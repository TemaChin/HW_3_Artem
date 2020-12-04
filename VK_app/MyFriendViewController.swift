//
//  MyFriendViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

class MyFriendViewController: UIViewController {
    
    lazy var myFriendsNameLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var myFriendsCityLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var myFriendsBackButton: MyButton = {
        return MyButton()
    }()
    var currentFriend: MyFriendProfile? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myFriendsNameLabel)
        myFriendsNameLabelSetup()
        view.addSubview(myFriendsCityLabel)
        myFriendsCityLabelSetup()
        view.addSubview(myFriendsBackButton)
        myFriendsBackButtonSetup()

    }
    
    @ objc func myFriendBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }

}
