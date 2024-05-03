//
//  SelecaoFase.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI

struct SelecaoFase: View {
    var body: some View {
        ZStack{
            Image("Background1").ignoresSafeArea()
                .blur(radius: 5.0)
            HStack{
                NavigationLink {
                    Fase1()
                } label: {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                NavigationLink {
                    Fase2()
                } label: {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                NavigationLink {
                    Fase3()
                } label: {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                NavigationLink {
                    Fase4()
                } label: {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
                NavigationLink {
                    Fase5()
                } label: {
                    Circle()
                        .frame(width: 100)
                        .foregroundStyle(.black)
                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    SelecaoFase()
}
