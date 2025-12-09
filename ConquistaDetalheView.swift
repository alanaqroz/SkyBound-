//
//  ConquistaDetalheView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 04/12/25.
//

import SwiftUI

struct ConquistaDetalheView: View {
    let conquista: Conquista

    var body: some View {
        ZStack {
            Color("azulPrimario")
                .ignoresSafeArea()

            ScrollView {
                VStack(spacing: 24) {

                    Image(uiImage: conquista.imagem)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("roxoPrimario"), lineWidth: 5)
                        )
                        .padding(.horizontal, 20)

                    Text(conquista.titulo)
                        .font(.title2.bold())
                        .foregroundColor(Color("fontePrincipal"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)

                    Text(conquista.descricao)
                        .font(.body)
                        .foregroundColor(Color("fontePrincipal"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    Spacer(minLength: 40)
                }
                .padding(.top, 40)
            }
        }
    }
}
