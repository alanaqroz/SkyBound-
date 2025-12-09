//
//  CardConquistaView.swift
//  SkyBound
//
//  Created by Alana Queiroz on 03/12/25.
//
import SwiftUI

struct CardConquistaView: View {
    let conquista: Conquista
    let remover: () -> Void
    let editar: () -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Image(uiImage: conquista.imagem)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 180)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .clipped()
                .allowsHitTesting(false)
        
            HStack {
                Text(conquista.titulo)
                    .font(.headline)
                    .foregroundColor(Color("fonteColor"))
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
                    .accessibilityLabel("Conquista: \(conquista.titulo)")
                
                Spacer()
                
                Menu {
                    Button("Editar", action: editar)
                    Button("Excluir", role: .destructive, action: remover)
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                        .foregroundColor(Color("fonteColor"))
                        .padding(8)
                }
                .contentShape(Rectangle())
                .accessibilityLabel("Opções para \(conquista.titulo)")
            }
            .padding(.horizontal, 4)
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("roxoPrimario"))   
                .shadow(color: .black.opacity(0.1), radius: 6, x: 0, y: 3)
        )
    }
}
