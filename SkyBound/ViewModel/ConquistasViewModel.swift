//
//  ConquistasViewModel.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftUI
import SwiftData

class ConquistasViewModel: ObservableObject {

    @Published var context: ModelContext?
    @Published var categoriaSelecionada: Categoria? = nil

    func setContext(_ context: ModelContext) {
        self.context = context
    }

    func conquistasFiltradas(_ todas: [Conquista]) -> [Conquista] {
        guard let categoria = categoriaSelecionada else { return todas }
        return todas.filter { $0.categoria == categoria }
    }

    func adicionar(_ conquista: Conquista) {
        guard let context else { return }
        context.insert(conquista)
        try? context.save()
    }

    func remover(_ conquista: Conquista) {
        guard let context else { return }
        context.delete(conquista)
        try? context.save()
    }

    func atualizar(_ conquista: Conquista) {
        guard let context else { return }
        try? context.save()
    }
}
