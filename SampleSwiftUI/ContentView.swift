//
//  ContentView.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/10/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        HStack(spacing: 5){
            ForEach(0..<4){i in
                CardView(faceUp: ((i % 2) != 0))
            }
        }
        .padding(10)
        .foregroundColor(Color.orange)
    }
}


struct CardView: View {
    var faceUp: Bool
    var body: some View {
        ZStack{
            if faceUp {
                RoundedRectangle(cornerRadius:10).stroke(lineWidth: 3)
                Text("😅")
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
        ContentView()
    }
}
