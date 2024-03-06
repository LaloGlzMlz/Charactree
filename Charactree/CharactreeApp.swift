//
//  CharactreeApp.swift
//  Charactree
//
//  Created by Eduardo Gonzalez Melgoza on 29/02/24.
//

import SwiftUI
import SwiftData


@main
struct MyApp: App {
    
    let modelContainer: ModelContainer
    
    init() {
        
        do {
            modelContainer = try ModelContainer(for: Book.self, BookCharacter.self, Connection.self)
        } catch {
            fatalError("ModelContainer has not been initialized.")
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            BooksView()
        }
        .modelContainer(modelContainer)
    }
}
