//
//  SheetView.swift
//  CodeKid's
//
//  Created by found on 11/06/24.
//

import SwiftUI

struct SheetView: View {
    
    let id: Int
    
    @EnvironmentObject var appState: AppState
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack{
            Color.white
            Color.blue.opacity(0.25).ignoresSafeArea()
            VStack{
                Text("\(id)")
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Ver Mapa")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .background {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundStyle(.white)
                        }
                })
                NavigationLink {
                    Fase(viewModel: $appState.stages[id+1])
                } label: {
                    Text("Proxima Fase")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: 100)
                        .background {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundStyle(.white)
                        }
                }
                .disabled(appState.stages.count < id + 1)
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        SheetView(id: 4)
    }
    .environmentObject(AppState())
}
