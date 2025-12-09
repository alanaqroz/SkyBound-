//
//  StartView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 08/12/25.
//

import SwiftUI

struct IntroView: View {
    @AppStorage("hasSeenIntro") private var hasSeenIntro = false

    var body: some View {
        ZStack {
            Image("capa")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                Spacer()

                Button {
                    hasSeenIntro = true
                } label: {
                    Image("botao")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60)
                }
                .padding(.bottom, 190)
            }
        }
    }
}
