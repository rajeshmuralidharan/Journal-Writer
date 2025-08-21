//
//  ChatEntry.swift
//  Journal Writer
//
//  Created by RAJESH MURALIDHARAN on 8/20/25.
//

import Foundation


struct ChatEntry: Codable, Hashable {
    
    public enum Who : String, Codable {
        case user = "user"
        case assistant = "assistant"
    }
    
    let id: UUID
    let text: String
    let who: Who
    
}
