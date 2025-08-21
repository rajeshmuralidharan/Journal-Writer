//
//  ChatHistoryView.swift
//  Journal Writer
//
//  Created by RAJESH MURALIDHARAN on 8/20/25.
//

import SwiftUI

struct ChatHistoryView: View {
    @Binding var chatHistory : [ChatEntry]
    
    var body: some View {
        List(chatHistory, id: \.id) { entry in
            Text(entry.text)
                .padding(10)
                .background((isUser(entry) ? .blue : .clear))
                .clipShape(Capsule())
                .frame(maxWidth: .infinity, alignment: (isUser(entry) ?  .trailing : .leading))
                
            
        }
        .background(Color.clear.opacity(0.01))
    }
    
    func isUser(_ entry: ChatEntry) -> Bool {
        entry.who == ChatEntry.Who.user
    }
}

