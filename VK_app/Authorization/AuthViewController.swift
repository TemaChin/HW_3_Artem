//
//  AuthViewController.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import UIKit

class AuthViewController: UIViewController {

    lazy var vkLabel: UILabel = {
        return UILabel()
    }()
    lazy var vkTextLogin: UITextField = {
        return UITextField()
    }()
    lazy var vkLoginLabel: UILabel = {
        return UILabel()
    }()
    lazy var vkPasswordLabel: UILabel = {
        return UILabel()
    }()
    lazy var vkTextPassword: UITextField = {
        return UITextField()
    }()
    lazy var vkAuthButton: UIButton = {
        return UIButton()
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
                
//                let viewController = UINavigationController(rootViewController: MyViewController())
//                UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = viewController

                let viewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "MyNaviViewController")
                UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController = viewController
            }
        }
    }
}



