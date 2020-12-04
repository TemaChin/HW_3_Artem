//
//  ViewSetup.swift
//  HomeWork_2_AppScreens
//
//  Created by Артем Станкевич on 28.11.2020.
//

import UIKit
import FirebaseDatabase

class MyLabel: UILabel {
    func Setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.textAlignment = .center
    }
}
class MyTextField: UITextField {
    func Setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Helvetica", size: 15)
        self.textAlignment = .left
        self.layer.cornerRadius = 5.0
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
    }
}
class MyButton: UIButton {
    var ref: DatabaseReference?
    var databaseHandele: DatabaseHandle?
    var myColor: String?

    func setColor(_ currentColor: String) -> CGColor {
        switch currentColor {
        case "white":
            return UIColor.white.cgColor
        case "blue":
            return UIColor.blue.cgColor
        case "yellow":
            return UIColor.yellow.cgColor
        default:
            return UIColor.white.cgColor
        }
    }
    func Setup() {
        ref = Database.database().reference()
        databaseHandele = ref?.child("buttonBackground").observe(.childAdded, with: { (snapshot) in
            self.myColor = snapshot.value as? String
        })
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.backgroundColor = setColor(myColor ?? "")
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.setTitleColor(.black, for: .normal)
    }
    /// Настройки кнопки цвет фона голубой, цвет текста белый
    func SetupBlueWhite() {
        ref = Database.database().reference()
        databaseHandele = ref?.child("buttonBackground").observe(.childAdded, with: { (snapshot) in
            self.myColor = snapshot.value as? String
        })
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .blue
        self.setTitleColor(.white, for: .normal)
    }
}
