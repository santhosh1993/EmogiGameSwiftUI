//
//  MemoryGame.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/10/20.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    init(numberOfPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<numberOfPairs {
            let content = cardContentFactory(pairIndex)
            cards.append(Card.init(id: 2 * pairIndex, content: content))
            cards.append(Card.init(id: 2 * pairIndex + 1, content: content))
        }
    }
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    struct Card: Identifiable{
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
