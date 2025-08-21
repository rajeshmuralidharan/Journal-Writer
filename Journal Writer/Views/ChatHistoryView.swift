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
                .foregroundStyle(entry.who == ChatEntry.Who.user ? .green : .red)
        }
    }
}

