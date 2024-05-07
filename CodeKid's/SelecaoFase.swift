//
//  SelecaoFase.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI

struct Stage: Identifiable {
    let id: UUID
    let name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}

struct SelecaoFase: View {
    
    let stages: [Stage] = [
        Stage(name: "Fase 1"),
        Stage(name: "Fase 2"),
        Stage(name: "Fase 3"),
        Stage(name: "Fase 4"),
        Stage(name: "Fase 5")
    ]
    
    func nextView(from stageName: String) -> some View {
        switch stageName {
        case "Fase 1":
            return AnyView(Fase1())
        case "Fase 2":
            return AnyView(Fase2())
        case "Fase 3":
            return AnyView(Fase3())
        case "Fase 4":
            return AnyView(Fase4())
        case "Fase 5":
            return AnyView(Fase5())
        default:
            return AnyView(Homepage(nome: "Arley"))
        }
    }
    
    var body: some View {
        ZStack{
            Image("Background1").ignoresSafeArea()
                .blur(radius: 5.0)
            HStack {
                ForEach(stages) { stage in
                    NavigationLink {
                        nextView(from: stage.name)
                    } label: {
                        VStack{
                            Circle()
                                .frame(width: 150)
                                .foregroundStyle(.black)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .padding()
                            Text(stage.name)
                                .font(.system(size: 50))
                                .foregroundStyle(Color.black)
                                .bold()
                            HStack{
                                ForEach(0..<3){ _ in
                                    Image(systemName: "star")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 30))
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        SelecaoFase()
    }
}
