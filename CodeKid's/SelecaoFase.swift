//
//  SelecaoFase.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI

struct SelecaoFase: View {
        
    @State var stages = [
        TartarugaViewModel(
            name: "Fase 1",
            grid: 5,
            moveOptions: [.right, .left],
            stars: [2, 3, 4],
            yellowColor: [2, 3, 5], 
            greenCellPosition: 4
        ),
        TartarugaViewModel(
            name: "Fase 2",
            grid: 15,
            moveOptions: Move.allCases,
            stars: [5, 8, 13],
            yellowColor: [12, 11, 7],
            greenCellPosition: 10
        ),
        TartarugaViewModel(
            name: "Fase 3",
            grid: 20,
            moveOptions: Move.allCases,
            stars: [6, 10, 19],
            yellowColor: [2, 13, 16],
            greenCellPosition: 20
        ),
        TartarugaViewModel(
            name: "Fase 4",
            grid: 25,
            moveOptions: Move.allCases,
            stars: [1, 20, 14],
            yellowColor: [2, 22, 15],
            greenCellPosition: 25
        ),
        TartarugaViewModel(
            name: "Fase 5",
            grid: 25,
            moveOptions: Move.allCases,
            stars: [7, 21, 11],
            yellowColor: [2, 13, 24],
            greenCellPosition: 25
            
        )
    ]
    
    func nextView(from stageName: String) -> some View {
        switch stageName {
        case "Fase 1":
            return AnyView(Fase(viewModel: $stages[0]))
//        case "Fase 2":
//            return AnyView(Fase2(viewModel: $stages[1]))
//        case "Fase 3":
//            return AnyView(Fase3(viewModel: $stages[2]))
//        case "Fase 4":
//            return AnyView(Fase4(viewModel: $stages[3]))
//        case "Fase 5":
//            return AnyView(Fase5(viewModel: $stages[4]))
        case "Fase 2":
            return AnyView(
                Fase(viewModel: $stages[1])
            )
        case "Fase 3":
            return AnyView(
                Fase(viewModel: $stages[2])
            )
        case "Fase 4":
            return AnyView(
                Fase(viewModel: $stages[3])
            )
        case "Fase 5":
            return AnyView(
                Fase(viewModel: $stages[4])
            )
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
                            HStack {
                                ForEach(0..<3) { indexStar in
                                    Image(systemName: indexStar < stage.tartaruga.estrelas ? "star.fill" : "star")
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
