//
//  SkyBoundApp.swift
//  SkyBound
//
//  Created by Alana Queiroz on 01/12/25.
//

import SwiftUI
import SwiftData

@main
struct MeuApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Conquista.self)
    }
}
