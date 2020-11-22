//
//  MyViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

class MyViewController: UIViewController {

    lazy var myNameLabel: UILabel = {
        return UILabel()
    }()
    lazy var myCityLabel: UILabel = {
        return UILabel()
    }()
    lazy var myFriends: UIButton = {
        return UIButton()
    }()
    let fileHandlerMyView = FileHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myData()
        view.addSubview(myNameLabel)
        myNameLabelSetup()
        view.addSubview(myCityLabel)
        myCityLabelSetup()
        view.addSubview(myFriends)
        myFriendsSetup()
        
    }
    
    @ objc func vkFriendsButtonAction() {
        
        if let viewController = String(describing: FriendsViewController.self).viewController() as? FriendsViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    }
}
