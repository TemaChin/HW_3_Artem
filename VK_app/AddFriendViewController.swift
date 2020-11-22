//
//  AddFriendViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData

class AddFriendViewController: UIViewController {
    
    lazy var addBackButton: UIButton = {
        return UIButton()
    }()
    lazy var addDoneButton: UIButton = {
        return UIButton()
    }()
    lazy var nameFriendAddFriendLabel: UILabel = {
        return UILabel()
    }()
    lazy var nameFriendAddFriendTextField: UITextField? = {
        return UITextField()
    }()
    lazy var cityFriendAddFriendLabel: UILabel = {
        return UILabel()
    }()
    lazy var cityFriendAddFriendTextField: UITextField? = {
        return UITextField()
    }()
    var createdFrind: MyFriendProfile? = nil
    weak var listener: OutputView? = nil
    

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
        
        
        let name = nameFriendAddFriendTextField?.text ?? "не указано имя"
        let city = cityFriendAddFriendTextField?.text ?? "не указан город"
        let newFriend = MyFriendProfile(name, city)
        self.listener?.output(newFriend, identifier: String(describing: AddFriendViewController.self))
        self.navigationController?.popViewController(animated: true)

    }
}
