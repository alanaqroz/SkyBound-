//
//  Conquista.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftData
import UIKit

@Model
class Conquista: Identifiable {
    @Attribute(.unique) var id: UUID = UUID()
    var titulo: String
    var descricao: String
    var imagemData: Data

    var imagem: UIImage {
        UIImage(data: imagemData) ?? UIImage()
    }

    init(titulo: String, descricao: String, imagem: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.imagemData = imagem.jpegData(compressionQuality: 0.9) ?? Data()
    }

    func atualizarImagem(_ nova: UIImage) {
        self.imagemData = nova.jpegData(compressionQuality: 0.9) ?? Data()
    }
}
