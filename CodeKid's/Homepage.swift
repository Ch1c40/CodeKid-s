//
//  Homepage.swift
//  CodeKid's
//
//  Created by found on 30/04/24.
//

import SwiftUI


struct Homepage: View {
    
    var nome: String
    
    var body: some View {
        ZStack(alignment: .top){
            Color.primary.opacity(0.3).ignoresSafeArea()
            VStack(alignment: .center){
                HStack{
                    Text("Bem vindo, \(nome)!")
                        .font(.system(size: 25))
                        .padding([.horizontal], 460)
                }
                .padding([.bottom], 20)
                Text("Escolha o Mundo para começar")
                    .font(.system(size: 48))
                    .bold()
                    .padding([.bottom], -20)
                VStack{
                    NavigationLink {
                        SelecaoFase()
                    } label: {
                        Image("praia")
                            .resizable()
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .frame(width: 350, height: 350)
                            .padding()
                            .shadow(radius: 10)
                    }
                    Text("Praia")
                        .bold()
                        .font(.system(size: 43))
                }
                .padding(50)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    Homepage(nome:"Arley")
}
