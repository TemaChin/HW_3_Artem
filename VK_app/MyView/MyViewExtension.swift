//
//  MyViewExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

extension MyViewController {
    
    func myNameLabelSetup() {
        myNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myNameLabel.textAlignment = .center
        myNameLabel.attributedText = NSAttributedString(string: fileHandlerMyView.fileRead("myName"), attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue, NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        myNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                                        myNameLabel.widthAnchor.constraint(equalToConstant: 100),
                                        myNameLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myCityLabelSetup() {
        myCityLabel.translatesAutoresizingMaskIntoConstraints = false
        myCityLabel.textAlignment = .center
        myCityLabel.attributedText = NSAttributedString(string: fileHandlerMyView.fileRead("myCity"), attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15) as Any, NSAttributedString.Key.foregroundColor : UIColor.blue])
        NSLayoutConstraint.activate([
                                        myCityLabel.leadingAnchor.constraint(equalTo: myNameLabel.leadingAnchor),
                                        myCityLabel.topAnchor.constraint(equalTo: myNameLabel.bottomAnchor),
                                        myCityLabel.widthAnchor.constraint(equalTo: myNameLabel.widthAnchor),
                                        myCityLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myFriendsSetup() {
        myFriends.translatesAutoresizingMaskIntoConstraints = false
        myFriends.layer.borderColor = UIColor.black.cgColor
        myFriends.layer.borderWidth = 1.0
        myFriends.layer.cornerRadius = 5.0
        myFriends.clipsToBounds = true
        myFriends.setTitleColor(.black, for: .normal)
        myFriends.setTitle("Friends", for: .normal)
        myFriends.backgroundColor = .blue
        myFriends.setTitleColor(.white, for: .normal)
        myFriends.addTarget(self, action: #selector(vkFriendsButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        myFriends.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myFriends.topAnchor.constraint(equalTo: myCityLabel.bottomAnchor, constant: 30),
                                        myFriends.widthAnchor.constraint(equalToConstant: 100),
                                        myFriends.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myData() {
        fileHandlerMyView.fileSave("myName", fileText: "Василий")
        fileHandlerMyView.fileSave("myCity", fileText: "СПб")
    }
}
