//
//  FileHandler.swift
//  VK_app
//
//  Created by Артем Станкевич on 21.11.2020.
//

import Foundation
import CoreData

struct FileHandler {
    let filemgr = FileManager.default
    func getDocumentsDirectory() -> URL {
        let paths = filemgr.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    func fileExist (_ filePath: String)-> Bool {
        if filemgr.fileExists(atPath: filePath) {
            return true
        } else {
            return false
        }
    }
    public func fileDelete(_ filePath: String) {
        guard fileExist(filePath) else {return}
        do {
            try filemgr.removeItem(atPath: filePath)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
    public func fileSave (_ filePath: String, fileText: String) {
        if fileExist(filePath) {
            fileDelete(filePath)
        }
        let url = getDocumentsDirectory().appendingPathComponent(filePath)
        do {
            try fileText.write(to: url, atomically: true, encoding: .utf8)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    public func fileRead(_ filePath: String) -> String {
        var input = ""
        let url = getDocumentsDirectory().appendingPathComponent(filePath)
        do {
            input = try String(contentsOf: url)
        } catch {
            print("Error: \(error.localizedDescription)")
        }
        return input
    }
}
