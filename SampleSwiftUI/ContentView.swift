//
//  ContentView.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var viewModel: EmogiMemoryGame
    
    var body: some View {
        HStack(spacing: 5){
            ForEach(viewModel.cards){card in
                CardView(card: card).onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    viewModel.chooseCard(card: card)
                })
            }
        }
        .padding(10)
        .foregroundColor(Color.orange)
    }
}


struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack{
            if card.isFaceUp {
                RoundedRectangle(cornerRadius:10).stroke(lineWidth: 3)
                Text(card.content)
            }
            else {
                RoundedRectangle(cornerRadius: 10).fill()
            }
        }
        .font(Font.largeTitle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmogiMemoryGame())
    }
}
