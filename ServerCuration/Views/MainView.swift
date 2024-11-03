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

struct ServerInfoText: View {
    var serverInfo: Server
    
    var body: some View {
        VStack(alignment: .leading) {
            let text: String = "\(serverInfo.user)@\(serverInfo.host):\(serverInfo.port)"
            
            NavigationLink(destination: ServerView(text: text)) {
                if !serverInfo.alias.isEmpty {
                    Text(serverInfo.alias)
                        .font(.headline)
                        .frame(height: 20)
                }
                else {
                    Text(text)
                        .font(.headline)
                        .frame(height: 20)
                }
            }
        }
        .padding()
    }
}


let serverList = genServerList(serverList: readServerList())

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
                
                List {
                    ForEach(serverList, id: \.id) { server in
                        ServerInfoText(serverInfo: server)
                    }
                }
                .onAppear {
                    for server in serverList {
                        print("\(server.user)@\(server.host):\(server.port)")
                    }
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
