//
//  ContentView.swift
//  CodeKid's
//
//  Created by found on 23/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appState = AppState()

    @State var showing: Bool = false
    
    @State var timer: Timer! // Optional
    
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 30) {
                NavigationLink {
                    TelaInicial()
                } label: {
                    ZStack {
                        VStack{
                            Circle()
                                .frame(width: 250)
                                .foregroundStyle(.tint)
                        }
                        Image(systemName: "play.fill")
                            .font(.system(size: 150))
                            .foregroundStyle(.white)
                    }
                }
                
                Text("Aperte para começar")
                    .font(.largeTitle)
                    .foregroundStyle(.black)
                    .bold()
                    .opacity(showing ? 1 : 0)
                    .animation(.linear(duration: 0.50), value: showing)
            }
            .onAppear {
                self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    showing.toggle()
                }
            }
        }
        .environmentObject(appState)
    }
}

#Preview {
    ContentView()
}
 
