//
//  Server.swift
//  ServerCuration
//
//  Created by Castor on 2024/10/27.
//

struct Server {
    var host: String = ""  // 服务器 IP
    var port: String = "22"  // 服务器端口
    var user: String = ""  // 服务器用户
    var alias: String = ""  // 服务器别名
    var password: String = ""  // 登录密码
}

func GenServerDict<T>(_ object: T) -> [String: Any] {
    var serverDict = [String: Any]()
    let mirror = Mirror(reflecting: object)
    
    for child in mirror.children {
        if let propertyName = child.label {
            serverDict[propertyName] = child.value
        }
    }
    
    return serverDict
}

