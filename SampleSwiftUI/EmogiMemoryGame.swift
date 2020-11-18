//
//  EmogiMemoryGame.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/11/20.
//

import SwiftUI

class EmogiMemoryGame {
    private var model: MemoryGame<String> = createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emogis = ["🤣","🎃"]
        return MemoryGame<String>.init(numberOfPairs: emogis.count) { (index) -> String in
            return emogis[index]
        }
    }
        
    //MARK:- Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK:- Intent(s)
    
    func chooseCard(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
}
