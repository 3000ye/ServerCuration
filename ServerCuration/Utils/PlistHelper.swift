//
//  PlistHelper.swift
//  ServerCuration
//
//  Created by Castor on 2024/10/27.
//

import Foundation

func saveServer(server: [String: Any]) {
    // 获取Documents目录路径
    let fileManager = FileManager.default
    if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let filePath = documentDirectory.appendingPathComponent("ServerList.plist")
        
        // 写入plist文件
        let dict = NSMutableDictionary(dictionary: server)
        dict.write(to: filePath, atomically: true)
        print("save server success!")
    }
}

func readServerList() {
    let fileManager = FileManager.default
    if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let filePath = documentDirectory.appendingPathComponent("ServerList.plist")
        
        // 检查文件是否存在
        if fileManager.fileExists(atPath: filePath.path) {
            // 读取 plist 文件
            if let dict = NSDictionary(contentsOf: filePath) {
                print(dict)
            } else {
                print("无法读取 plist 文件")
            }
        } else {
            print("文件不存在")
        }
    }
}

