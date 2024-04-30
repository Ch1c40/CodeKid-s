//
//  SwiftUIView.swift
//  CodeKid's
//
//  Created by found on 30/04/24.
//

import SwiftUI

struct IdadePage: View {
    
    var nome: String
    
    @State var numero = 0
    
    var body: some View {
        ZStack{
            Color.cyan.opacity(0.8).ignoresSafeArea()
            VStack{
                Text("Olá, \(nome) qual sua idade?")
                    .font(.system(size: 70))
                    .bold()
                HStack{
                    TextField("Digite sua Idade", value: $numero, format: .number)
//                    TextField("Digite sua Idade", text: $idade.value)
                        .padding()
                        .font(.system(size: 50))
                        .keyboardType(.numberPad)
                        .frame(width: 400)
                        .background(.white.opacity(0.2))
                        .cornerRadius(30)
                    NavigationLink {
                        Homepage(nome: nome)
                    } label: {
                        Image(systemName: "arrowshape.right.fill")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.blue).cornerRadius(50)
                            .font(.system(size: 50))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    IdadePage(nome:"Arley")
}
