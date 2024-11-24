//
//  NewServerFormView.swift
//  ServerCuration
//
//  Created by Castor on 2024/11/11.
//

import SwiftUI

struct NewServerFormView: View {
    @Environment(\.dismiss) private var dismiss
    @State private var serverName: String = ""
    @State private var serverHost: String = ""
    @State private var serverPort: String = ""
    
    var body: some View {
        Form {
            Section(header: Text("Server Information")) {
                TextField("Server Name", text: $serverName)
                TextField("Host", text: $serverHost)
                TextField("Port", text: $serverPort)
                    .keyboardType(.numberPad)
            }
            
            HStack {
                Button("Cancel") {
                    dismiss()
                }
                .foregroundColor(.red)
                
                Spacer()
                
                Button("Save") {
                    saveServer()
                    dismiss()
                }
                .foregroundColor(.blue)
            }
        }
        .navigationTitle("Add New Server")
    }
    
    private func saveServer() {
        // 这里添加保存表单数据的操作
        print("Server saved: \(serverName), \(serverHost), \(serverPort)")
    }
}

#Preview {
    NewServerFormView()
}
