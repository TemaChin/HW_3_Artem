//
//  AuthViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

class AuthViewController: UIViewController {

    lazy var vkLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var vkTextLogin: MyTextField = {
        return MyTextField()
    }()
    lazy var vkLoginLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var vkPasswordLabel: MyLabel = {
        return MyLabel()
    }()
    lazy var vkTextPassword: MyTextField = {
        return MyTextField()
    }()
    lazy var vkAuthButton: MyButton = {
        return MyButton()
    }()
    let fileHandler = FileHandler()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(vkTextLogin)
        vkTextLoginSetup()
        view.addSubview(vkLoginLabel)
        vkLoginLabelSetup()
        view.addSubview(vkPasswordLabel)
        vkPasswordLabelSetup()
        view.addSubview(vkTextPassword)
        vkTextPasswordSetup()
        view.addSubview(vkLabel)
        vkLabelSetup()
        view.addSubview(vkAuthButton)
        vkAuthButtonSetup()
        doAuth()

        }
        
    @objc func vkAuthButtonAction() {
        if let login = vkTextLogin.text,
           let password = vkTextPassword.text {
            if login == fileHandler.fileRead("login"), password == fileHandler.fileRead("password") {
                let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyNaviViewController")
                UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = viewController
            }
        }
    }
}



