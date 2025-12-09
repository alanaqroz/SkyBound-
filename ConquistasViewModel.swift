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

    func setContext(_ context: ModelContext) {
        self.context = context
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
