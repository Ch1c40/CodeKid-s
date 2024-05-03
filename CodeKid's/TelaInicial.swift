//
//  TelaInicial.swift
//  CodeKid's
//
//  Created by found on 26/04/24.
//

import SwiftUI
struct TelaInicial: View {

    @State private var userName: String = " "
    
    var body: some View {
            ZStack{
                Color.cyan.opacity(0.8).ignoresSafeArea()
                VStack{
                    Text("Qual o seu nome?")
                        .bold()
                        .font(.system(size: 70))
                    HStack{
                        TextField("Digite seu nome", text: $userName)
                            .font(.system(size: 50))
                            .padding()
                            .frame(width: 600)
                            .background(Color.black.opacity(0.1))
                            .cornerRadius(30)
                        NavigationLink {
                            IdadePage(nome: userName)
                        } label: {
                            Image(systemName: "arrowshape.right.fill")
                                .foregroundStyle(.white)
                                .padding()
                                .background(.blue).cornerRadius(50)
                                .font(.system(size: 50))
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    TelaInicial()
}
