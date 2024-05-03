//
//  Homepage.swift
//  CodeKid's
//
//  Created by found on 30/04/24.
//

import SwiftUI

struct BlueButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle)
            .bold()
            .padding()
            .frame(width: 400)
            .foregroundStyle(.black)
            .background(Color.white)
            .cornerRadius(25)
    }
}

struct MenuScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.9).ignoresSafeArea()
            VStack{
                Button("CONFIGURAÇÃO") {
                    
                }
                Button("PONTUAÇÃO") {
                    
                }
                Button("SAIR") {
                    
                }
            }
            .buttonStyle(BlueButton())
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(alignment: .topTrailing) {
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(.white)
                    .onTapGesture {
                        dismiss()
                    }
                    .padding()
            }
        }
    }
}

struct Homepage: View {
    
    @State private var showingSheet = false
    
    var nome: String
    
    var body: some View {
        ZStack(alignment: .top){
            Color.primary.opacity(0.3).ignoresSafeArea()
            VStack(alignment: .center){
                HStack{
                    Text("Bem vindo, \(nome)!")
                        .font(.system(size: 25))
                        .padding([.horizontal], 460)
                    ZStack{
                        Circle()
                            .frame(width: 44)
                            .foregroundStyle(.tint)
                            .onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                MenuScreen()
                            }
                        Image(systemName: "line.3.horizontal")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
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
