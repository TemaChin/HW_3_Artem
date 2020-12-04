//
//  MyViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import FirebaseDatabase

class MyViewController: UIViewController {

    lazy var myNameLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var myCityLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var myFriends: MyButton = {
        return MyButton()
    }()
    
    let fileHandlerMyView = FileHandler()
    
    var ref: DatabaseReference?
    
    lazy var setupWhiteButton: MyButton = {
        return MyButton()
    }()
    lazy var setupBlueButton: MyButton = {
        return MyButton()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myData()
        view.addSubview(myNameLabel)
        myNameLabelSetup()
        view.addSubview(myCityLabel)
        myCityLabelSetup()
        view.addSubview(myFriends)
        myFriendsSetup()
        view.addSubview(setupWhiteButton)
        setupWhiteButtonSetup()
        view.addSubview(setupBlueButton)
        setupBlueButtonSetup()
        
    }
    
    @ objc func vkFriendsButtonAction() {
        
        if let viewController = String(describing: FriendsViewController.self).viewController() as? FriendsViewController {
            self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    }
    
    @ objc func setupWhiteButtonAction(_ sender: Any) {
        var ref = Database.database().reference()
        ref.removeValue()
        ref.child("buttonBackground").childByAutoId().setValue("white")
    }
    
    @ objc func setupBlueButtonButtonAction() {
        var ref = Database.database().reference()
        ref.removeValue()
        ref.child("buttonBackground").childByAutoId().setValue("blue")
    }

}
