//
//  SampleSwiftUIApp.swift
//  SampleSwiftUI
//
//  Created by Admin on 18/10/20.
//

import SwiftUI

@main
struct SampleSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: EmogiMemoryGame())
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
