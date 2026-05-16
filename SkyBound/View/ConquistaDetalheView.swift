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
                        .scaledToFill()
                        .frame(maxWidth: .infinity)
                        .frame(height: 260)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color("roxoPrimario"), lineWidth: 5)
                        )
                        .shadow(color: .black.opacity(0.10), radius: 10, y: 4)
                        .padding(.horizontal, 20)

                    Text(conquista.titulo)
                        .font(.title2.bold())
                        .foregroundColor(Color("fontePrincipal"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 20)

                    VStack(alignment: .leading, spacing: 12) {
                        Text("Descrição")
                            .font(.headline)
                            .foregroundColor(Color("roxoPrimario"))

                        Text(conquista.descricao)
                            .font(.body)
                            .foregroundColor(Color("fontePrincipal"))
                            .multilineTextAlignment(.leading)
                    }
                    .padding(20)
                    .frame(maxWidth: .infinity)
                    .background(Color.white.opacity(0.15))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal, 20)

                    Spacer(minLength: 50)
                }
                .padding(.top, 40)
            }
        }
    }
}
