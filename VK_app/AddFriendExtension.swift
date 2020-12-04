//
//  AddFriendExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData
import RealmSwift

extension AddFriendViewController: UITextFieldDelegate {
    
//    func setText(_ name: String, _ sizeFont: Int) -> UIFont {
//        return UIFont(name: name, size: CGFloat(sizeFont))!
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    func addBackButtonSetup() {
        addBackButton.Setup()
        addBackButton.setTitle("back", for: .normal)
        addBackButton.addTarget(self, action: #selector(addFriendBackButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        addBackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        addBackButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                                        addBackButton.widthAnchor.constraint(equalToConstant: 50),
                                        addBackButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func addDoneButtonSetup() {
        addDoneButton.Setup()
        addDoneButton.setTitle("add", for: .normal)
        addDoneButton.addTarget(self, action: #selector(addFriendDoneButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        addDoneButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
                                        addDoneButton.topAnchor.constraint(equalTo: addBackButton.topAnchor),
                                        addDoneButton.widthAnchor.constraint(equalToConstant: 50),
                                        addDoneButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func nameFriendAddFriendLabelSetup() {
        nameFriendAddFriendLabel.Setup()
        nameFriendAddFriendLabel.attributedText = NSAttributedString(string: "Имя друга", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        nameFriendAddFriendLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                        nameFriendAddFriendLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                                        nameFriendAddFriendLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
                                        nameFriendAddFriendLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func nameFriendAddFriendTextFieldSetup() {
        nameFriendAddFriendTextField!.Setup()
        NSLayoutConstraint.activate([
                                        nameFriendAddFriendTextField!.centerXAnchor.constraint(equalTo: nameFriendAddFriendLabel.centerXAnchor),
                                        nameFriendAddFriendTextField!.topAnchor.constraint(equalTo: nameFriendAddFriendLabel.bottomAnchor),
                                        nameFriendAddFriendTextField!.widthAnchor.constraint(equalTo: nameFriendAddFriendLabel.widthAnchor),
                                        nameFriendAddFriendTextField!.heightAnchor.constraint(equalToConstant: 50)])
    }
    func cityFriendAddFriendLabelSetup() {
        cityFriendAddFriendLabel.Setup()
        cityFriendAddFriendLabel.attributedText = NSAttributedString(string: "Город друга", attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        cityFriendAddFriendLabel.centerXAnchor.constraint(equalTo: nameFriendAddFriendTextField!.centerXAnchor),
                                        cityFriendAddFriendLabel.topAnchor.constraint(equalTo: nameFriendAddFriendTextField!.bottomAnchor),
                                        cityFriendAddFriendLabel.widthAnchor.constraint(equalTo: nameFriendAddFriendTextField!.widthAnchor),
                                        cityFriendAddFriendLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func cityFriendAddFriendTextFieldSetup() {
        cityFriendAddFriendTextField!.Setup()
        NSLayoutConstraint.activate([
                                        cityFriendAddFriendTextField!.centerXAnchor.constraint(equalTo: cityFriendAddFriendLabel.centerXAnchor),
                                        cityFriendAddFriendTextField!.topAnchor.constraint(equalTo: cityFriendAddFriendLabel.bottomAnchor),
                                        cityFriendAddFriendTextField!.widthAnchor.constraint(equalTo: cityFriendAddFriendLabel.widthAnchor),
                                        cityFriendAddFriendTextField!.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func createFriend() {
        if !nameFriendAddFriendTextField!.text!.isEmpty || !cityFriendAddFriendTextField!.text!.isEmpty {
        if let context = StoreManager.shared.context {
            if let Entity = NSEntityDescription.entity(forEntityName: "Friend", in: context) {
                let friend = Friend(entity: Entity, insertInto: context)
                friend.name = nameFriendAddFriendTextField?.text ?? "не указано имя"
                friend.city = cityFriendAddFriendTextField?.text ?? "не указан город"
                do {
                    try context.save()
                } catch _ {
                    
                }
            } else {
                print("Не создался")
            }
        }
    }
    }
    func createFriendRealm() {
        if !nameFriendAddFriendTextField!.text!.isEmpty || !cityFriendAddFriendTextField!.text!.isEmpty {
            let newFriend = MyFriendProfileRealm()
            newFriend.friendName = nameFriendAddFriendTextField?.text ?? "не указано имя"
            newFriend.friendCity = cityFriendAddFriendTextField?.text ?? "не указан город"
            try! realm?.write{
                realm?.add(newFriend)
//                    print(self.realm?.configuration.fileURL?.absoluteURL as Any)
                }
        }
    }
}
