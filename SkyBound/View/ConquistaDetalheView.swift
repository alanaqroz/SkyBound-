//
//  ConquistaDetalheView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 04/12/25.
//

import SwiftUI

struct ConquistaDetalheView: View {
    let conquista: Conquista

    @Environment(\.colorScheme) var colorScheme
    @State private var mostrarPreviewCompartilhar = false

    var body: some View {
        ZStack {
            Color("azulPrimario").ignoresSafeArea()

            ScrollView {
                VStack(spacing: 0) {

                    // Foto hero
                    ZStack(alignment: .topLeading) {
                        Image(uiImage: conquista.imagem)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 320)
                            .clipped()

                        // Gradiente suavizando embaixo
                        VStack {
                            Spacer()
                            LinearGradient(
                                colors: [.clear, Color("azulPrimario")],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                            .frame(height: 140)
                        }
                        .frame(height: 320)

                        // Badge de categoria — canto superior esquerdo da foto
                        HStack(spacing: 6) {
                            Image(systemName: conquista.categoria.icone)
                                .font(.caption.weight(.semibold))
                            Text(conquista.categoria.rawValue)
                                .font(.caption.weight(.bold))
                        }
                        .padding(.horizontal, 12)
                        .padding(.vertical, 7)
                        .background(.ultraThinMaterial)
                        .foregroundColor(conquista.categoria.cor)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.15), radius: 4, y: 2)
                        .padding(.top, 56)
                        .padding(.leading, 20)
                    }

                    // Conteúdo principal
                    VStack(alignment: .leading, spacing: 20) {

                        // Título
                        Text(conquista.titulo)
                            .font(.title.bold())
                            .foregroundColor(Color("fontePrincipal"))
                            .fixedSize(horizontal: false, vertical: true)

                        // Divider na cor da categoria
                        RoundedRectangle(cornerRadius: 2)
                            .fill(conquista.categoria.cor.opacity(0.4))
                            .frame(height: 2)

                        // Descrição
                        if !conquista.descricao.isEmpty {
                            VStack(alignment: .leading, spacing: 8) {
                                Label("Descrição", systemImage: "text.alignleft")
                                    .font(.subheadline.weight(.semibold))
                                    .foregroundColor(conquista.categoria.cor)

                                Text(conquista.descricao)
                                    .font(.body)
                                    .foregroundColor(Color("fontePrincipal").opacity(0.85))
                                    .lineSpacing(5)
                                    .fixedSize(horizontal: false, vertical: true)
                            }
                            .padding(18)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color("fontePrincipal").opacity(0.06))
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.top, 8)
                    .padding(.bottom, 50)
                }
            }
            .ignoresSafeArea(edges: .top)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    mostrarPreviewCompartilhar = true
                } label: {
                    Image(systemName: "square.and.arrow.up")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(conquista.categoria.cor)
                }
            }
        }
        .sheet(isPresented: $mostrarPreviewCompartilhar) {
            PreviewCompartilharSheet(conquista: conquista)
        }
    }
}

// UIActivityViewController wrapper
struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any]

    func makeUIViewController(context: Context) -> UIActivityViewController {
        UIActivityViewController(activityItems: items, applicationActivities: nil)
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
