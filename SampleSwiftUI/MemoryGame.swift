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

        cards.shuffle()
    }
    
    mutating func choose(card: Card) {
        print("card chosen: \(card)")
        do {
            let ind = try index(of: card)
            cards[ind].isFaceUp = !cards[ind].isFaceUp
        }
        catch {
            
        }
    }
    
    func index(of card: Card) throws -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        throw NotFound.index
    }
    
    struct Card: Identifiable{
        var id: Int
        
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
    
    enum NotFound: Error {
        case index
    }
}
