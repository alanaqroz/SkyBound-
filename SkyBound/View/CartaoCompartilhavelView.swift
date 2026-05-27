//
//  CartaoCompartilhavelView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftUI

struct CartaoCompartilhavelView: View {
    let conquista: Conquista

    var body: some View {
        ZStack {
            // Fundo degradê roxo
            LinearGradient(
                colors: [
                    conquista.categoria.cor,
                    conquista.categoria.cor.opacity(0.6),
                    Color("roxoPrimario")
                ],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )

            VStack(spacing: 0) {

                // Foto
                Image(uiImage: conquista.imagem)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .frame(height: 280)
                    .clipped()
                    .overlay(
                        // Gradiente embaixo da foto para suavizar a transição
                        LinearGradient(
                            colors: [.clear, conquista.categoria.cor.opacity(0.8)],
                            startPoint: .center,
                            endPoint: .bottom
                        )
                    )

                // Conteúdo inferior
                VStack(alignment: .leading, spacing: 12) {

                    // Badge categoria
                    HStack(spacing: 6) {
                        Image(systemName: conquista.categoria.icone)
                            .font(.caption.weight(.semibold))
                        Text(conquista.categoria.rawValue.uppercased())
                            .font(.caption.weight(.bold))
                            .kerning(1.2)
                    }
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(.white.opacity(0.25))
                    .foregroundColor(.white)
                    .clipShape(Capsule())

                    // Título
                    Text(conquista.titulo)
                        .font(.title2.bold())
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .fixedSize(horizontal: false, vertical: true)

                    // Descrição (máx 3 linhas)
                    if !conquista.descricao.isEmpty {
                        Text(conquista.descricao)
                            .font(.subheadline)
                            .foregroundColor(.white.opacity(0.85))
                            .lineLimit(3)
                            .fixedSize(horizontal: false, vertical: true)
                    }

                    // Rodapé com logo
                    HStack {
                        Spacer()
                        HStack(spacing: 4) {
                            Image(systemName: "star.fill")
                                .font(.caption2)
                            Text("SkyBound")
                                .font(.caption.weight(.semibold))
                        }
                        .foregroundColor(.white.opacity(0.6))
                    }
                    .padding(.top, 4)
                }
                .padding(20)
                .background(
                    LinearGradient(
                        colors: [conquista.categoria.cor.opacity(0.8), Color("roxoPrimario")],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            }
        }
        .frame(width: 390, height: 520)
        .clipShape(RoundedRectangle(cornerRadius: 28))
    }
}
