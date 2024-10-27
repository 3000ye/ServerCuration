//
//  ContentView.swift
//  ServerCuration
//
//  Created by Castor on 2024/10/21.
//

import SwiftUI

extension Color {
    static let customRed = Color(red: 0.627, green: 0.0, blue: 0.0);
    static let customGrey = Color(red: 62.0 / 255, green: 58.0 / 255, blue: 57.0 / 255);
    static let customYellow = Color(red: 248 / 255, green: 183 / 255, blue: 74 / 255);
}

struct ServerView: View {
    var serverInfo: Server
    
    var body: some View {
        VStack(alignment: .leading) {
            if !serverInfo.alias.isEmpty {
                Text(serverInfo.alias).font(.headline).frame(height: 10)
                Text("\(serverInfo.user)@\(serverInfo.host):\(serverInfo.port)")
                    .font(.footnote)
                    .frame(height: 10)
            }
            else {
                Text("\(serverInfo.user)@\(serverInfo.host):\(serverInfo.port)")
                    .font(.headline)
                    .frame(height: 20)
            }
        }
        .padding()
    }
}

let serverList = [
    Server(host: "192.168.54.1", port: "22", user: "admin"),
    Server(host: "192.168.54.2", port: "22", user: "test", alias: "AliyunServer"),
    Server(host: "192.168.54.3", port: "22", user: "customer"),
    Server(host: "192.168.54.4", port: "22", user: "ubuntu")
]

struct MainView: View {
    var body: some View {
        // title
        NavigationView {
            VStack {
                VStack(spacing: 0) {
                    Text("Server Curation")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.customRed)
                        .shadow(color: Color.black.opacity(0.7), radius: 2, x: 1, y: 1)
                        .padding(6)
                    
                    Text("Select a Server to connect")
                        .font(.headline)
                        .foregroundColor(.customRed)
                }
                .padding(.top)
                
                List{
                    ForEach(serverList, id: \.host) { server in
                        ServerView(serverInfo: server)
                    }
                }
                .onAppear {
                    for server in serverList {
                        print("\(server.user)@\(server.host):\(server.port)")
                        
                        // 写入 plist 文件
                        saveServer(server: GenServerDict(server))
                    }
                    
                    readServerList()
                }
                
                Button("Add new Server") {
                    
                }
                .foregroundColor(.customGrey)
                .underline()
                .padding(.bottom)
            }
        }
    }
}


#Preview {
    MainView()
}
