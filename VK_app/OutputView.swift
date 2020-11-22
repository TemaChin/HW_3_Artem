//
//  OutputView.swift
//  HomeWork_2_AppScreens
//
//  Created by Артем Станкевич on 22.10.2020.
//

import Foundation
/// протокол входа данных
protocol OutputView: class {
    func output(_ data: Any?, identifier: String)
}
