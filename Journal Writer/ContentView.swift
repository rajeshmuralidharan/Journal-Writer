//
//  ContentView.swift
//  Journal Writer
//
//  Created by RAJESH MURALIDHARAN on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = JournalEntryViewModel()
    @State private var userInput: String = ""
    
    var body: some View {
        VStack {
            
            ChatHistoryView(chatHistory: $vm.chatEntries)
            
            HStack {
                TextField("Write here...", text: $userInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button("Send") {
                    vm.processUserInput(userInput)
                    userInput = ""
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
