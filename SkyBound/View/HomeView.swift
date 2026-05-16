//
//  HomeView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var context
    @Query(sort: \Conquista.titulo) var conquistas: [Conquista]

    @StateObject var vm = ConquistasViewModel()

    @State private var mostrarSheet = false
    @State private var conquistaEditando: Conquista?

    var body: some View {
        NavigationStack {
            ZStack(alignment: .topLeading) {

                Color("azulPrimario").edgesIgnoringSafeArea(.all)

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Minhas conquistas")
                            .font(.title.bold())
                            .foregroundColor(Color("azulSecundario"))

                        Spacer()

                        Button {
                            conquistaEditando = nil
                            mostrarSheet = true
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .font(.title2)
                                .foregroundStyle(Color("azulSecundario"))
                        }
                    }
                    .padding(.top, 10)

                    // Chips de filtro por categoria
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            // Chip "Todas"
                            Button {
                                vm.categoriaSelecionada = nil
                            } label: {
                                Text("Todas")
                                    .font(.subheadline.weight(.semibold))
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .background(vm.categoriaSelecionada == nil ? Color("azulSecundario") : Color("azulSecundario").opacity(0.25))
                                    .foregroundColor(vm.categoriaSelecionada == nil ? .white : Color("azulSecundario"))
                                    .clipShape(Capsule())
                            }

                            ForEach(Categoria.allCases, id: \.self) { categoria in
                                Button {
                                    vm.categoriaSelecionada = vm.categoriaSelecionada == categoria ? nil : categoria
                                } label: {
                                    HStack(spacing: 6) {
                                        Image(systemName: categoria.icone)
                                            .font(.caption)
                                        Text(categoria.rawValue)
                                            .font(.subheadline.weight(.semibold))
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(vm.categoriaSelecionada == categoria ? categoria.cor : categoria.cor.opacity(0.25))
                                    .foregroundColor(vm.categoriaSelecionada == categoria ? .white : categoria.cor)
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }

                    ScrollView {
                        VStack(spacing: 25) {
                            ForEach(vm.conquistasFiltradas(conquistas)) { conquista in
                                NavigationLink {
                                    ConquistaDetalheView(conquista: conquista)
                                } label: {
                                    CardConquistaView(
                                        conquista: conquista,
                                        remover: { vm.remover(conquista) },
                                        editar: {
                                            conquistaEditando = conquista
                                            mostrarSheet = true
                                        }
                                    )
                                }
                                .buttonStyle(.plain)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }

            .sheet(isPresented: $mostrarSheet) {
                SheetView(vm: vm, conquistaEditavel: $conquistaEditando)
            }
        }
        .onAppear {
            vm.setContext(context)
        }
    }
}

#Preview {
    HomeView()
}
