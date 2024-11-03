//
//  ServerView.swift
//  ServerCuration
//
//  Created by Castor on 2024/11/3.
//

import SwiftUI

struct ServerView: View {
    var text: String
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Hello, World!")
                
                Text(text)
            }
        }
    }
}

//#Preview {
//    ServerView()
//}
