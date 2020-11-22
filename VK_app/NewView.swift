//
//  NewUIView.swift
//  HomeWork_2_AppScreens
//
//  Created by Артем Станкевич on 22.10.2020.
//

import Foundation
import UIKit

extension String {
    /// переход вида с исп. Navigation controller
    func viewController (_ storyboard: String = "Main") -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self)
        return viewController
    }
}
