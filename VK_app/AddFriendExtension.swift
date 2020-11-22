//
//  AddFriendExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import CoreData

extension AddFriendViewController: UITextFieldDelegate {
    
    func setText(_ name: String, _ sizeFont: Int) -> UIFont {
        return UIFont(name: name, size: CGFloat(sizeFont))!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignFirstResponder()
        return true
    }
    
    func addBackButtonSetup() {
        addBackButton.translatesAutoresizingMaskIntoConstraints = false
        addBackButton.layer.borderColor = UIColor.black.cgColor
        addBackButton.layer.borderWidth = 1.0
        addBackButton.layer.cornerRadius = 5.0
        addBackButton.clipsToBounds = true
        addBackButton.setTitleColor(.black, for: .normal)
        addBackButton.setTitle("back", for: .normal)
        addBackButton.addTarget(self, action: #selector(addFriendBackButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        addBackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        addBackButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                                        addBackButton.widthAnchor.constraint(equalToConstant: 50),
                                        addBackButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func addDoneButtonSetup() {
        addDoneButton.translatesAutoresizingMaskIntoConstraints = false
        addDoneButton.layer.borderColor = UIColor.black.cgColor
        addDoneButton.layer.borderWidth = 1.0
        addDoneButton.layer.cornerRadius = 5.0
        addDoneButton.clipsToBounds = true
        addDoneButton.setTitleColor(.black, for: .normal)
        addDoneButton.setTitle("add", for: .normal)
        addDoneButton.addTarget(self, action: #selector(addFriendDoneButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        addDoneButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
                                        addDoneButton.topAnchor.constraint(equalTo: addBackButton.topAnchor),
                                        addDoneButton.widthAnchor.constraint(equalToConstant: 50),
                                        addDoneButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func nameFriendAddFriendLabelSetup() {
        nameFriendAddFriendLabel.translatesAutoresizingMaskIntoConstraints = false
        nameFriendAddFriendLabel.textAlignment = .center
        nameFriendAddFriendLabel.attributedText = NSAttributedString(string: "Имя друга", attributes: [NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        nameFriendAddFriendLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                        nameFriendAddFriendLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                                        nameFriendAddFriendLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
                                        nameFriendAddFriendLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func nameFriendAddFriendTextFieldSetup() {
        nameFriendAddFriendTextField!.translatesAutoresizingMaskIntoConstraints = false
        nameFriendAddFriendTextField!.textAlignment = .left
        nameFriendAddFriendTextField!.layer.cornerRadius = 5.0
        nameFriendAddFriendTextField!.layer.borderColor = UIColor.black.cgColor
        nameFriendAddFriendTextField!.layer.borderWidth = 1.0
        nameFriendAddFriendTextField!.font = UIFont(name: "Helvetica", size: 15)
        NSLayoutConstraint.activate([
                                        nameFriendAddFriendTextField!.centerXAnchor.constraint(equalTo: nameFriendAddFriendLabel.centerXAnchor),
                                        nameFriendAddFriendTextField!.topAnchor.constraint(equalTo: nameFriendAddFriendLabel.bottomAnchor),
                                        nameFriendAddFriendTextField!.widthAnchor.constraint(equalTo: nameFriendAddFriendLabel.widthAnchor),
                                        nameFriendAddFriendTextField!.heightAnchor.constraint(equalToConstant: 50)])
    }
    func cityFriendAddFriendLabelSetup() {
        cityFriendAddFriendLabel.translatesAutoresizingMaskIntoConstraints = false
        cityFriendAddFriendLabel.textAlignment = .center
        cityFriendAddFriendLabel.attributedText = NSAttributedString(string: "Город друга", attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        cityFriendAddFriendLabel.centerXAnchor.constraint(equalTo: nameFriendAddFriendTextField!.centerXAnchor),
                                        cityFriendAddFriendLabel.topAnchor.constraint(equalTo: nameFriendAddFriendTextField!.bottomAnchor),
                                        cityFriendAddFriendLabel.widthAnchor.constraint(equalTo: nameFriendAddFriendTextField!.widthAnchor),
                                        cityFriendAddFriendLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func cityFriendAddFriendTextFieldSetup() {
        cityFriendAddFriendTextField!.translatesAutoresizingMaskIntoConstraints = false
        cityFriendAddFriendTextField!.textAlignment = .left
        cityFriendAddFriendTextField!.layer.cornerRadius = 5.0
        cityFriendAddFriendTextField!.layer.borderColor = UIColor.black.cgColor
        cityFriendAddFriendTextField!.layer.borderWidth = 1.0
        cityFriendAddFriendTextField!.font = setText("Helvetica", 15)
        NSLayoutConstraint.activate([
                                        cityFriendAddFriendTextField!.centerXAnchor.constraint(equalTo: cityFriendAddFriendLabel.centerXAnchor),
                                        cityFriendAddFriendTextField!.topAnchor.constraint(equalTo: cityFriendAddFriendLabel.bottomAnchor),
                                        cityFriendAddFriendTextField!.widthAnchor.constraint(equalTo: cityFriendAddFriendLabel.widthAnchor),
                                        cityFriendAddFriendTextField!.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    func createFriend() {
        print("----------LOOK----1-------------")
        if let context = StoreManager.shared.context {
            print("----------LOOK----2-------------")
            print(StoreManager.shared.context as Any)
            print("----------LOOK----2-------------")
            // здесь не создается entity
            if let Entity = NSEntityDescription.entity(forEntityName: "Friend", in: context) {
                print("----------LOOK----3-------------")
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
