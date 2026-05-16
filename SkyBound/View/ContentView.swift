//
//  ContentView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 08/12/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("hasSeenIntro") private var hasSeenIntro: Bool = false
    
    var body: some View {
        if hasSeenIntro {
            HomeView()
        } else {
            IntroView()   
        }
    }
}
