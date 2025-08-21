//
//  JournalWriter.swift
//  Journal Writer
//
//  Created by RAJESH MURALIDHARAN on 8/20/25.
//

import Combine
import Foundation
import FoundationModels

class JournalWriter : ObservableObject{
        
    static let shared = JournalWriter( )
    
    private let INSTRUCTIONS = "Your are journaling tool. Converse with the user and when they ask summarize their day into a journal entry"
    private var model = SystemLanguageModel.default
    private var schemaSent = false
    private var session : LanguageModelSession?
 
    var isResponding = false
    @Published var llmResponse = ""
   
    
    init( ) {
       
        initiateSessionWith(instructions: INSTRUCTIONS)
    }
    
    func initiateSessionWith(instructions: String) -> Void {
        session = LanguageModelSession(instructions: instructions)
        session?.prewarm()
    }
    
    func fetchSync(prompt: String) async -> String {
        do {
            let value = try await session?.respond(to: prompt, options: GenerationOptions(temperature: 0.1))
            
            return value?.content ?? ""
        } catch {
            return ""
        }
    }
    
        
}
