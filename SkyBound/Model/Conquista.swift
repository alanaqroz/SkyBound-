//
//  Conquista.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftData
import SwiftUI
import UIKit

enum Categoria: String, CaseIterable, Codable {
    case saude        = "Saúde"
    case estudos      = "Estudos"
    case pessoal      = "Pessoal"
    case fitness      = "Fitness"
    case criatividade = "Criatividade"

    var cor: Color {
        switch self {
        case .saude:        return Color("categoriaSaude")
        case .estudos:      return Color("categoriaEstudos")
        case .pessoal:      return Color("categoriaPessoal")
        case .fitness:      return Color("categoriaFitness")
        case .criatividade: return Color("categoriaCriatividade")
        }
    }

    var icone: String {
        switch self {
        case .saude:        return "heart.fill"
        case .estudos:      return "book.fill"
        case .pessoal:      return "person.fill"
        case .fitness:      return "figure.run"
        case .criatividade: return "paintbrush.fill"
        }
    }
}

@Model
class Conquista: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var titulo: String
    var descricao: String
    var imagemData: Data
    var categoriaRaw: String = Categoria.pessoal.rawValue

    var categoria: Categoria {
        get { Categoria(rawValue: categoriaRaw) ?? .pessoal }
        set { categoriaRaw = newValue.rawValue }
    }

    var imagem: UIImage {
        UIImage(data: imagemData) ?? UIImage()
    }

    init(titulo: String, descricao: String, imagem: UIImage, categoria: Categoria = .pessoal) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagemData = imagem.jpegData(compressionQuality: 0.9) ?? Data()
        self.categoriaRaw = categoria.rawValue
    }

    func atualizarImagem(_ nova: UIImage) {
        self.imagemData = nova.jpegData(compressionQuality: 0.9) ?? Data()
    }
}
