//
//  AddFriendViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData
import RealmSwift

class AddFriendViewController: UIViewController {
    
    lazy var addBackButton: MyButton = {
        return MyButton()
    }()
    lazy var addDoneButton: MyButton = {
        return MyButton()
    }()
    lazy var nameFriendAddFriendLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var nameFriendAddFriendTextField: MyTextField? = {
        return MyTextField()
    }()
    lazy var cityFriendAddFriendLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var cityFriendAddFriendTextField: MyTextField? = {
        return MyTextField()
    }()
    var createdFrind: MyFriendProfile? = nil
    weak var listener: OutputView? = nil
    lazy var realm = try? Realm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(addBackButton)
        addBackButtonSetup()
        view.addSubview(addDoneButton)
        addDoneButtonSetup()
        view.addSubview(nameFriendAddFriendLabel)
        nameFriendAddFriendLabelSetup()
        view.addSubview(nameFriendAddFriendTextField!)
        nameFriendAddFriendTextFieldSetup()
        view.addSubview(cityFriendAddFriendLabel)
        cityFriendAddFriendLabelSetup()
        view.addSubview(cityFriendAddFriendTextField!)
        cityFriendAddFriendTextFieldSetup()
        
    }
    
    @ objc func addFriendBackButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }

    @ objc func addFriendDoneButtonAction() {
        
        self.createFriend()
        self.createFriendRealm()
        
        self.navigationController?.popViewController(animated: true)

    }
}
