import Foundation
import SQLite3

struct Server {
    var host: String = ""  // 服务器 IP
    var port: String = "22"  // 服务器端口
    var user: String = ""  // 服务器用户
    var alias: String = ""  // 服务器别名
}

import SQLite3

var db: OpaquePointer?

func createDatabase() {
    let fileURL = try! FileManager.default
        .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("MyDatabase.sqlite")

    if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
        print("Error opening database")
    }
    else {
        print("open database success!")
    }
}

createDatabase()

