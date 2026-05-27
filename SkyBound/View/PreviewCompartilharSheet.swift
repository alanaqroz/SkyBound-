//
//  PreviewCompartilharSheet.swift
//  SkyBound
//

import SwiftUI

struct PreviewCompartilharSheet: View {
    let conquista: Conquista
    @Environment(\.dismiss) var dismiss

    @State private var imagemGerada: UIImage? = nil
    @State private var mostrarShareSheet = false
    @State private var salvando = false
    @State private var salvo = false

    var body: some View {
        ZStack {
            // Fundo escuro desfocado
            Color.black.opacity(0.92).ignoresSafeArea()

            VStack(spacing: 28) {

                // Topo: título e fechar
                HStack {
                    Button { dismiss() } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white.opacity(0.7))
                            .padding(10)
                            .background(.white.opacity(0.12))
                            .clipShape(Circle())
                    }
                    Spacer()
                    Text("Compartilhar conquista")
                        .font(.subheadline.weight(.semibold))
                        .foregroundColor(.white.opacity(0.85))
                    Spacer()
                    // espaçador invisível p/ centralizar título
                    Color.clear.frame(width: 36, height: 36)
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)

                Spacer()

                // Cartão centralizado com sombra
                CartaoCompartilhavelView(conquista: conquista)
                    .shadow(color: conquista.categoria.cor.opacity(0.5), radius: 30, y: 10)
                    .scaleEffect(0.88)

                Spacer()

                // Botões
                VStack(spacing: 12) {

                    // Botão principal: compartilhar
                    Button {
                        gerarECompartilhar()
                    } label: {
                        HStack(spacing: 10) {
                            Image(systemName: "square.and.arrow.up")
                                .font(.system(size: 16, weight: .semibold))
                            Text("Compartilhar")
                                .font(.body.weight(.semibold))
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 16)
                        .background(
                            LinearGradient(
                                colors: [conquista.categoria.cor, conquista.categoria.cor.opacity(0.75)],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(color: conquista.categoria.cor.opacity(0.5), radius: 10, y: 4)
                    }

                    // Botão secundário: salvar na galeria
                    Button {
                        salvarNaGaleria()
                    } label: {
                        HStack(spacing: 8) {
                            if salvando {
                                ProgressView()
                                    .tint(.white)
                                    .scaleEffect(0.85)
                            } else if salvo {
                                Image(systemName: "checkmark")
                                    .font(.system(size: 15, weight: .semibold))
                            } else {
                                Image(systemName: "square.and.arrow.down")
                                    .font(.system(size: 15, weight: .semibold))
                            }
                            Text(salvo ? "Salvo!" : "Salvar na galeria")
                                .font(.body.weight(.medium))
                        }
                        .foregroundColor(.white.opacity(0.85))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 14)
                        .background(.white.opacity(0.1))
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .disabled(salvando || salvo)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 36)
            }
        }
        .sheet(isPresented: $mostrarShareSheet) {
            if let img = imagemGerada {
                ShareSheet(items: [img])
            }
        }
    }

    @MainActor
    private func gerarImagem() -> UIImage? {
        let renderer = ImageRenderer(content: CartaoCompartilhavelView(conquista: conquista))
        renderer.scale = 3.0
        return renderer.uiImage
    }

    @MainActor
    private func gerarECompartilhar() {
        imagemGerada = gerarImagem()
        mostrarShareSheet = true
    }

    @MainActor
    private func salvarNaGaleria() {
        guard let img = gerarImagem() else { return }
        salvando = true
        UIImageWriteToSavedPhotosAlbum(img, nil, nil, nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
            salvando = false
            salvo = true
        }
    }
}
