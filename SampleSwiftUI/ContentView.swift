//
//  ContentView.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @ObservedObject var viewModel: EmogiMemoryGame
    
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
        GeometryReader { geometry  in
            ZStack{
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius:cornerRadius).stroke(lineWidth: edgeLineWidth)
                    Text(card.content)
                }
                else {
                    RoundedRectangle(cornerRadius: cornerRadius).fill()
                }
            }
            .font(Font.system(size: min(geometry.size.width, geometry.size.height) * scaleFactor))
        }
    }
    
    //MARK:- Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let scaleFactor: CGFloat = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmogiMemoryGame())
    }
}
