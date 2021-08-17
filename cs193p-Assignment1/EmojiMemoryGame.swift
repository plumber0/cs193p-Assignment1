//
//  EmojiMemoryGame.swift
//  cs193p-Assignment1
//
//  Created by SeungWoo on 2021/08/17.
//

import SwiftUI

class EmojiMemoryGame {
    static let animals = ["🐶", "🐱", "🐭", "🐹", "🐰",
                          "🦊", "🐻", "🐼", "🐻‍❄️", "🐨",
                          "🐯", "🦁", "🐮", "🐷", "🐽"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            animals[pairIndex]
            
        }
        
    }

    private var model: MemoryGame<String> = createMemoryGame()
    
    // computed property syntax
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
