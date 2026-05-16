//
//  SheetView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//

import SwiftUI
import PhotosUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    @ObservedObject var vm: ConquistasViewModel

    @State private var selectedImage: UIImage?
    @State private var showImagePicker = false
    @Binding var conquistaEditavel: Conquista?

    @State private var titulo = ""
    @State private var descricao = ""
    @State private var categoriaSelecionada: Categoria = .pessoal

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {

                ZStack(alignment: .topTrailing) {

                    Group {
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                        } else {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color("roxoPrimario").opacity(0.08))
                                .overlay(
                                    VStack {
                                        Image(systemName: "photo.on.rectangle.angled")
                                            .font(.system(size: 36))
                                            .foregroundColor(Color("roxoPrimario"))

                                        Text("Clique para escolher uma foto")
                                            .font(.body)
                                            .foregroundColor(.gray)
                                    }
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    .contentShape(Rectangle())
                                    .onTapGesture { showImagePicker = true }  // área clicável
                                )
                        }
                    }
                    .frame(height: 220)
                    .clipped()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color("roxoBottunSalvar"), lineWidth: 4)
                    )
                    .padding(.horizontal, 16)


                    Button {
                        showImagePicker = true
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.white.opacity(0.9))
                            .clipShape(Circle())
                    }
                    .padding(.trailing, 32)
                    .padding(.top, 10)
                }


                // Seletor de categoria
                VStack(alignment: .leading, spacing: 10) {
                    Text("Categoria:")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 16)

                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(Categoria.allCases, id: \.self) { categoria in
                                Button {
                                    categoriaSelecionada = categoria
                                } label: {
                                    HStack(spacing: 6) {
                                        Image(systemName: categoria.icone)
                                            .font(.caption)
                                        Text(categoria.rawValue)
                                            .font(.subheadline.weight(.semibold))
                                    }
                                    .padding(.horizontal, 14)
                                    .padding(.vertical, 8)
                                    .background(categoriaSelecionada == categoria ? categoria.cor : categoria.cor.opacity(0.2))
                                    .foregroundColor(categoriaSelecionada == categoria ? .white : categoria.cor)
                                    .clipShape(Capsule())
                                }
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 4)
                    }
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text("Título:")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        

                    TextField("Ex: Passei na faculdade", text: $titulo)
                        .font(.body)
                        .padding()
                        .foregroundColor(.black)
                        .background(Color("azulSheet"))
                        .cornerRadius(20)
                }
                .padding(.horizontal, 16)

                VStack(alignment: .leading, spacing: 8) {
                    Text("Descrição:")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    TextEditor(text: $descricao)
                        .font(.body)
                        .foregroundColor(.black)  
                        .padding(10)
                        .scrollContentBackground(.hidden)
                        .frame(minHeight: 120)
                        .background(Color("azulSheet"))
                        .cornerRadius(20)
                }
                .padding(.horizontal, 16)

                Button {
                    guard let imagem = selectedImage else { return }

                    if let editando = conquistaEditavel {
                        editando.titulo = titulo
                        editando.descricao = descricao
                        editando.categoria = categoriaSelecionada
                        editando.atualizarImagem(imagem)
                        vm.atualizar(editando)
                    } else {
                        let nova = Conquista(
                            titulo: titulo.isEmpty ? "Sem título" : titulo,
                            descricao: descricao,
                            imagem: imagem,
                            categoria: categoriaSelecionada
                        )
                        vm.adicionar(nova)
                    }

                    conquistaEditavel = nil
                    dismiss()
                } label: {
                    Text("Salvar")
                        .foregroundColor(.white)
                        .font(.body.weight(.semibold))
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("roxoBottunSalvar"))
                        .cornerRadius(30)
                }
                .padding(.horizontal, 80)
                .padding(.top, 20)
                .opacity(selectedImage == nil ? 0.6 : 1.0)
                .disabled(selectedImage == nil)


                Spacer(minLength: 60)
            }
            .padding(.top, 16)
            
            .onAppear {
                if let c = conquistaEditavel {
                    selectedImage = c.imagem
                    titulo = c.titulo
                    descricao = c.descricao
                    categoriaSelecionada = c.categoria
                }
            }
        }
        .background(Color.white)
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }
}
