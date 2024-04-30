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
            .foregroundStyle(.white)
            .background(Color.blue)
            .cornerRadius(25)
    }
}

struct MenuScreen: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                    .onTapGesture {
                        dismiss()
                    }
                    .padding()
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
                        .padding([.horizontal], 430)
                    ZStack{
                        Image(systemName: "line.3.horizontal")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        Circle()
                            .frame(width: 44)
                            .foregroundStyle(.gray.opacity(0.2))
                            .onTapGesture {
                                showingSheet.toggle()
                            }
                            .sheet(isPresented: $showingSheet) {
                                MenuScreen()
                            }
                    }
                }
                .padding([.bottom], 100)
                Text("Escolha o Mundo para começar")
                    .font(.system(size: 32))
                    .bold()
                    .padding([.bottom], 40)
                HStack{
                    VStack{
                        Circle()
                            .frame(width: 200)
                        Text("Praia")
                            .padding()
                            .bold()
                            .font(.title)
                        
                    }
                    .padding(50)
                    VStack{
                        Circle()
                            .frame(width: 200)
                        Text("Floresta")
                            .padding()
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .padding(50)
                    VStack{
                        Circle()
                            .frame(width: 200)
                        Text("Cidade")
                            .padding()
                            .bold()
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    }
                    .padding(50)
                }
            }
        }
    }
}

#Preview {
    Homepage(nome:"Arley")
}
