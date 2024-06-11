//
//  SelecaoFase.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI

class AppState: ObservableObject {
    
    @Published var stages = [
        TartarugaViewModel(
            id: 0,
            name: "Fase 1",
            grid: 5,
            moveOptions: [.right, .left],
            stars: [2, 3, 4],
            yellowColor: [2, 3, 5],
            greenCellPosition: 4,
            obstaculo: [Obstaculo(x: 20, y: 0, picture: "obstaculo1")]
        ),
        TartarugaViewModel(
            id: 1,
            name: "Fase 2",
            grid: 15,
            moveOptions: Move.allCases,
            stars: [5, 8, 13],
            yellowColor: [12, 11, 7],
            greenCellPosition: 10,
            obstaculo: [Obstaculo(x: 1, y: 2, picture: "obstaculo1"),
                        Obstaculo(x: 0, y: 4, picture: "obstaculo2"),
                        Obstaculo(x: 0, y: 3, picture: "obstaculo3")]
        ),
        TartarugaViewModel(
            id: 2,
            name: "Fase 3",
            grid: 20,
            moveOptions: Move.allCases,
            stars: [6, 10, 19],
            yellowColor: [2, 13, 16],
            greenCellPosition: 8,
            obstaculo: [Obstaculo(x: 2, y: 3, picture: "obstaculo2")]
        ),
        TartarugaViewModel(
            id: 3,
            name: "Fase 4",
            grid: 25,
            moveOptions: Move.allCases,
            stars: [1, 20, 14],
            yellowColor: [2, 22, 15],
            greenCellPosition: 13,
            obstaculo: [Obstaculo(x: 4, y: 4, picture: "obstaculo3")]
        ),
        TartarugaViewModel(
            id: 4,
            name: "Fase 5",
            grid: 25,
            moveOptions: Move.allCases,
            stars: [7, 21, 11],
            yellowColor: [2, 13, 24],
            greenCellPosition: 12,
            obstaculo: [Obstaculo(x: 0, y: 2, picture: "obstaculo3")]
            
        )
    ]
    
}

struct SelecaoFase: View {
    
    @EnvironmentObject var appState: AppState
    
    func nextView(from stageName: String) -> some View {
        switch stageName {
        case "Fase 1":
            return AnyView(
                Fase(viewModel: $appState.stages[0])
            )
        case "Fase 2":
            return AnyView(
                Fase(viewModel: $appState.stages[1])
            )
        case "Fase 3":
            return AnyView(
                Fase(viewModel: $appState.stages[2])
            )
        case "Fase 4":
            return AnyView(
                Fase(viewModel: $appState.stages[3])
            )
        case "Fase 5":
            return AnyView(
                Fase(viewModel: $appState.stages[4])
            )
        default:
            return AnyView(Homepage(nome: "Arley"))
        }
    }
    
    var body: some View {
        ZStack{
            Image("praia")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 5.0)
                .aspectRatio(1.5, contentMode: .fill)
            HStack {
                ForEach(appState.stages) { stage in
                    NavigationLink {
                        nextView(from: stage.name)
                    } label: {
                        VStack{
                            Image("icone1")
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 150, height: 150)
                                .shadow(radius: 10)
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
