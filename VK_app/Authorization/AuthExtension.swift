//
//  AuthExtension.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

extension AuthViewController {
    
    func vkLabelSetup() {
        vkLabel.Setup()
//        vkLabel.translatesAutoresizingMaskIntoConstraints = false
        vkLabel.attributedText = NSAttributedString(string: "Vkontakte", attributes: [NSAttributedString.Key.foregroundColor: UIColor.blue, NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 20) as Any])
//        vkLabel.textAlignment = .center
        NSLayoutConstraint.activate([
                                        vkLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                        vkLabel.bottomAnchor.constraint(equalTo: vkLoginLabel.topAnchor, constant: -50),
                                        vkLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.5),
                                        vkLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func vkTextLoginSetup() {
        vkTextLogin.Setup()
//        vkTextLogin.translatesAutoresizingMaskIntoConstraints = false
//        vkTextLogin.font = UIFont(name: "Helvetica", size: 15)
//        vkTextLogin.textAlignment = .left
//        vkTextLogin.layer.cornerRadius = 5.0
//        vkTextLogin.layer.borderColor = UIColor.black.cgColor
//        vkTextLogin.layer.borderWidth = 1.0
        NSLayoutConstraint.activate([
                                        vkTextLogin.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                                        vkTextLogin.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -50),
                                        vkTextLogin.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.7),
                                        vkTextLogin.heightAnchor.constraint(equalToConstant: 50)])
    }
    func vkLoginLabelSetup() {
        vkLoginLabel.Setup()
//        vkLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        vkLoginLabel.attributedText = NSAttributedString(string: "login", attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15) as Any])
//        vkLoginLabel.textAlignment = .center
        NSLayoutConstraint.activate([
                                        vkLoginLabel.centerXAnchor.constraint(equalTo: vkTextLogin.centerXAnchor),
                                        vkLoginLabel.bottomAnchor.constraint(equalTo: vkTextLogin.topAnchor),
                                        vkLoginLabel.widthAnchor.constraint(equalTo: vkTextLogin.widthAnchor),
                                        vkLoginLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func vkPasswordLabelSetup() {
        vkPasswordLabel.Setup()
//        vkPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
//        vkPasswordLabel.textAlignment = .center
        vkPasswordLabel.attributedText = NSAttributedString(string: "password", attributes: [NSAttributedString.Key.font : UIFont(name: "Helvetica", size: 15) as Any])
        NSLayoutConstraint.activate([
                                        vkPasswordLabel.centerXAnchor.constraint(equalTo: vkTextLogin.centerXAnchor),
                                        vkPasswordLabel.topAnchor.constraint(equalTo: vkTextLogin.bottomAnchor, constant: 50),
                                        vkPasswordLabel.widthAnchor.constraint(equalTo: vkTextLogin.widthAnchor),
                                        vkPasswordLabel.heightAnchor.constraint(equalToConstant: 50)])
    }
    func vkTextPasswordSetup() {
        vkTextPassword.Setup()
//        vkTextPassword.translatesAutoresizingMaskIntoConstraints = false
//        vkTextPassword.font = UIFont(name: "Helvetica", size: 15)
//        vkTextPassword.textAlignment = .left
//        vkTextPassword.layer.cornerRadius = 5.0
//        vkTextPassword.layer.borderColor = UIColor.black.cgColor
//        vkTextPassword.layer.borderWidth = 1.0
        NSLayoutConstraint.activate([
                                        vkTextPassword.centerXAnchor.constraint(equalTo: vkTextLogin.centerXAnchor),
                                        vkTextPassword.topAnchor.constraint(equalTo: vkPasswordLabel.bottomAnchor),
                                        vkTextPassword.widthAnchor.constraint(equalTo: vkTextLogin.widthAnchor),
                                        vkTextPassword.heightAnchor.constraint(equalToConstant: 50)])
    }
    func vkAuthButtonSetup() {
        vkAuthButton.SetupBlueWhite()
//        vkAuthButton.translatesAutoresizingMaskIntoConstraints = false
//        vkAuthButton.layer.borderColor = UIColor.black.cgColor
//        vkAuthButton.layer.borderWidth = 1.0
//        vkAuthButton.layer.cornerRadius = 5.0
//        vkAuthButton.clipsToBounds = true
//        vkAuthButton.setTitleColor(.black, for: .normal)
        vkAuthButton.setTitle("Sign UP", for: .normal)
//        vkAuthButton.backgroundColor = .blue
//        vkAuthButton.setTitleColor(.white, for: .normal)
        vkAuthButton.addTarget(self, action: #selector(vkAuthButtonAction), for: .touchUpInside)
        NSLayoutConstraint.activate([
                                        vkAuthButton.centerXAnchor.constraint(equalTo: vkTextLogin.centerXAnchor),
                                        vkAuthButton.topAnchor.constraint(equalTo: vkTextPassword.bottomAnchor, constant: 50),
                                        vkAuthButton.widthAnchor.constraint(equalTo: vkTextLogin.widthAnchor, multiplier: 1/3),
                                        vkAuthButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    func doAuth() {
        fileHandler.fileSave("login", fileText: "Vasja")
        fileHandler.fileSave("password", fileText: "12345")
    }
}
