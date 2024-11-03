//
//  PlistHelper.swift
//  ServerCuration
//
//  Created by Castor on 2024/10/27.
//

import Foundation

func saveServer(server: [String: Any]) {
    let fileManager = FileManager.default
    if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let filePath = documentDirectory.appendingPathComponent("ServerList.plist")
        
        var serverList: [[String: Any]] = []
        
        // 检查文件是否存在
        if fileManager.fileExists(atPath: filePath.path) {
            // 读取已有的 plist 文件
            if let existingList = NSArray(contentsOf: filePath) as? [[String: Any]] {
                serverList = existingList
            } else {
                print("无法读取 plist 文件")
            }
        }
        
        // 检查 server 是否已经存在
        if !serverList.contains(where: { $0["host"] as? String == server["host"] as? String && $0["port"] as? Int == server["port"] as? Int }) {
            // 如果不存在，则新增到列表中
            serverList.append(server)
            // 将更新后的列表写入 plist 文件
            (serverList as NSArray).write(to: filePath, atomically: true)
            print("save server success!")
        } else {
            print("\(String(describing: server["host"]))该服务器已存在，未进行保存。")
        }
    }
}


func readServerList() -> [[String: Any]] {
    let fileManager = FileManager.default
    if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
        let filePath = documentDirectory.appendingPathComponent("ServerList.plist")
        
        // 检查文件是否存在
        if fileManager.fileExists(atPath: filePath.path) {
            // 读取 plist 文件
            if let serverList = NSArray(contentsOf: filePath) as? [[String: Any]] {
                for server in serverList {
                    print(server)
                }
                return serverList
            } else {
                print("无法读取 plist 文件")
            }
        } else {
            print("文件不存在")
        }
    }
    
    return []
}

