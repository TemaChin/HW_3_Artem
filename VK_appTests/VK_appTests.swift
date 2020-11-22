//
//  VK_appTests.swift
//  VK_appTests
//
//  Created by Артем Станкевич on 21.11.2020.
//

import XCTest

@testable import VK_app

class VK_appTests: XCTestCase {

    /// Тест при правильном логине и пароле переходит ли на основной экран
    class AuthTest: XCTestCase {
        
        let authtest = AuthViewController()
        let authtest2 = MyViewController()
        var result = ""
        
        func testAuth() {
            
            authtest.vkTextLogin.text = "Vasja"
            authtest.vkTextPassword.text = "12345"
            let rootView1 = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController
            authtest.vkAuthButtonAction()
            let rootView2 = UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.rootViewController
            if rootView1 != rootView2 {
                result = "Test passed"
            } else { result = "" }
            
            XCTAssertEqual(result, "Test passed", "Test failed")
        }
    }
    
    /// Создает ли  модель друга
    class modelFriend: XCTestCase {
        
        var result = ""
        
        func testModelFriend() {
            
        let friend = MyFriendProfile("Friend1", "City1")
        var modelFriend = [MyFriendProfile]()
        modelFriend.append(friend)
            if modelFriend[0].name == friend.name, modelFriend[0].info == friend.info {
                result = "Test passed"
            } else { result = "" }
        
            XCTAssertEqual(result, "Test passed", "Test failed")
        }
    }
}
