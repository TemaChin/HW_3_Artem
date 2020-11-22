//
//  MyFriendExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

extension MyFriendViewController: IInputView  {

    func input(_ data: Any?) {
        if let data = data as? MyFriendProfile {
            self.currentFriend = data
        }
    }
    func myFriendsNameLabelSetup() {
        myFriendsNameLabel.translatesAutoresizingMaskIntoConstraints = false
        myFriendsNameLabel.textAlignment = .center
        myFriendsNameLabel.attributedText = NSAttributedString(string: currentFriend?.name ?? "_", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font: UIFont(name: "Helvetica", size: 20) as Any])
        NSLayoutConstraint.activate([
                                        myFriendsNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myFriendsNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 110),
                                        myFriendsNameLabel.widthAnchor.constraint(equalToConstant: 100),
                                        myFriendsNameLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myFriendsCityLabelSetup() {
        myFriendsCityLabel.translatesAutoresizingMaskIntoConstraints = false
        myFriendsCityLabel.textAlignment = .center
        myFriendsCityLabel.attributedText = NSAttributedString(string: currentFriend?.info ?? "_", attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15) as Any, NSAttributedString.Key.foregroundColor : UIColor.blue])
        NSLayoutConstraint.activate([
                                        myFriendsCityLabel.leadingAnchor.constraint(equalTo: myFriendsNameLabel.leadingAnchor),
                                        myFriendsCityLabel.topAnchor.constraint(equalTo: myFriendsNameLabel.bottomAnchor),
                                        myFriendsCityLabel.widthAnchor.constraint(equalTo: myFriendsNameLabel.widthAnchor),
                                        myFriendsCityLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func myFriendsBackButtonSetup() {
        myFriendsBackButton.translatesAutoresizingMaskIntoConstraints = false
        myFriendsBackButton.layer.borderColor = UIColor.black.cgColor
        myFriendsBackButton.layer.borderWidth = 1.0
        myFriendsBackButton.layer.cornerRadius = 5.0
        myFriendsBackButton.clipsToBounds = true
        myFriendsBackButton.setTitleColor(.black, for: .normal)
        myFriendsBackButton.setTitle("back", for: .normal)
        myFriendsBackButton.addTarget(self, action: #selector(myFriendBackButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        myFriendsBackButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 50),
                                        myFriendsBackButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 30),
                                        myFriendsBackButton.widthAnchor.constraint(equalToConstant: 50),
                                        myFriendsBackButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}
