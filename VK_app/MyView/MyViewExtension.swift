//
//  MyViewExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit
import FirebaseDatabase

extension MyViewController {
    
    func myNameLabelSetup() {
        myNameLabel.Setup()
        myNameLabel.attributedText = NSAttributedString(string: fileHandlerMyView.fileRead("myName"), attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue, NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        myNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                                        myNameLabel.widthAnchor.constraint(equalToConstant: 100),
                                        myNameLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myCityLabelSetup() {
        myCityLabel.Setup()
        myCityLabel.attributedText = NSAttributedString(string: fileHandlerMyView.fileRead("myCity"), attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15) as Any, NSAttributedString.Key.foregroundColor : UIColor.blue])
        NSLayoutConstraint.activate([
                                        myCityLabel.leadingAnchor.constraint(equalTo: myNameLabel.leadingAnchor),
                                        myCityLabel.topAnchor.constraint(equalTo: myNameLabel.bottomAnchor),
                                        myCityLabel.widthAnchor.constraint(equalTo: myNameLabel.widthAnchor),
                                        myCityLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myFriendsSetup() {
        myFriends.SetupBlueWhite()
        myFriends.setTitle("Friends", for: .normal)
        myFriends.addTarget(self, action: #selector(vkFriendsButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        myFriends.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myFriends.topAnchor.constraint(equalTo: myCityLabel.bottomAnchor, constant: 30),
                                        myFriends.widthAnchor.constraint(equalToConstant: 100),
                                        myFriends.heightAnchor.constraint(equalToConstant: 50)])
    }
    func setupWhiteButtonSetup() {
        setupWhiteButton.Setup()
        setupWhiteButton.setTitle("White", for: .normal)
        setupWhiteButton.addTarget(self, action: #selector(setupWhiteButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        setupWhiteButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -50),
                                        setupWhiteButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                                        setupWhiteButton.widthAnchor.constraint(equalToConstant: 80),
                                        setupWhiteButton.heightAnchor.constraint(equalToConstant: 30)])
    }
    func setupBlueButtonSetup() {
        setupBlueButton.Setup()
        setupBlueButton.setTitle("blue", for: .normal)
        setupBlueButton.addTarget(self, action: #selector(setupBlueButtonButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        setupBlueButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        setupBlueButton.topAnchor.constraint(equalTo: setupWhiteButton.topAnchor),
                                        setupBlueButton.widthAnchor.constraint(equalToConstant: 80),
                                        setupBlueButton.heightAnchor.constraint(equalToConstant: 30)])

    }
    func myData() {
        fileHandlerMyView.fileSave("myName", fileText: "Василий")
        fileHandlerMyView.fileSave("myCity", fileText: "СПб")
    }
}
