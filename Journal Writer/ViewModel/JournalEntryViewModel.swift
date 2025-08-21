//
//  JournalEntryViewModel.swift
//  Journal Writer
//
//  Created by RAJESH MURALIDHARAN on 8/20/25.
//

import Foundation
import Combine

class JournalEntryViewModel : ObservableObject {
    
    @Published var chatEntries: [ChatEntry] = []
    
    private let journalWriter = JournalWriter.shared
    
    
    func processUserInput(_ input: String) {
        let newEntry = ChatEntry(id: UUID(),  text: input, who:.user)
        chatEntries.append(newEntry)
        
        Task {
            let response = await journalWriter.fetchSync(prompt: input)
            await MainActor.run {
                let newEntry = ChatEntry(id: UUID(),  text: response, who:.assistant)
                self.chatEntries.append(newEntry)
            }
        }
        
    }
}
