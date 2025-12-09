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

                    ScrollView {
                        VStack(spacing: 25) {

                            ForEach(conquistas) { conquista in
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
//                        .padding(.bottom, 50)
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
