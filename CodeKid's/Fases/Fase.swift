//
//  Fase1.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI


struct Fase: View {
    
    @Binding var viewModel: TartarugaViewModel
    
    @State var moves: [Move] = []
    
    var body: some View {
        ZStack{
            Image("Background1")
                .blur(radius: 5.0)
                .ignoresSafeArea()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            
            Game(viewModel: $viewModel, stars: $viewModel.stars)
            ButtonPlay(
                viewModel: $viewModel,
                Moves: $moves
            )
            ButtonRestart(viewModel: $viewModel, Moves: $moves)
            Buttons(viewModel: $viewModel, Moves: $moves)
            Historic(Moves: $moves)
            
        }
    }
}

struct Game: View {
    
    @Binding var viewModel: TartarugaViewModel
    
    @Binding var stars: [Int]
    
    var body: some View{
        LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: 5), count: 5), spacing: 5) {
            ForEach(0..<viewModel.grid) { index in
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(color(index: index))
                    .border(Color.black)
                    .overlay {
                        if stars.contains(index) {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow)
                                .font(.largeTitle).bold()
                            
                        }
                    }
            }
        }
        .overlay(alignment: .topLeading) {
            Image(viewModel.tartaruga.picture)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100, alignment: .center)
                .offset(
                    x: 105*Double(viewModel.tartaruga.x),
                    y: 105*Double(viewModel.tartaruga.y)
                )
        }
        .clipped()
        .fixedSize(horizontal: true, vertical: true)
    }
    
    func color(index: Int) -> Color {
        if viewModel.yellowColor.contains(index) {
            return Color.yellow.opacity(0.23)
        }
        else if viewModel.greenCellPosition == index {
            return Color.green
        }
        else {
            return Color.black.opacity(0.25)
        }
    }
    
}

struct ButtonPlay: View {
    
    @Binding var viewModel: TartarugaViewModel
    @Binding var Moves: [Move]
    
    
    var body: some View {
        Button(action: play) {
            Image(systemName: "play.circle.fill")
                .foregroundStyle(.tint)
                .font(.system(size: 60))
        }
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .sheet(isPresented: $viewModel.win) {
            SheetView()
        }
        
    }
    
    func play() {
        viewModel.task = Task {
            for move in Moves {
                
                if Task.isCancelled { return }
                
                if move == .left && viewModel.tartaruga.x > 0 {
                    withAnimation(.linear(duration: 1)) {
                        viewModel.tartaruga.x += move.dx
                    }
                    
                }
                else if move == .right && viewModel.tartaruga.x < 4 {
                    withAnimation(.linear(duration: 1)) {
                        viewModel.tartaruga.x += move.dx
                    }
                    
                }
                else if move == .up && viewModel.tartaruga.y > 0 {
                    withAnimation(.linear(duration: 1)) {
                        viewModel.tartaruga.y += move.dy
                    }
                    
                }
                else if move == .down && viewModel.tartaruga.y < (viewModel.grid - 1) {
                    withAnimation(.linear(duration: 1)) {
                        viewModel.tartaruga.y += move.dy
                    }
                    
                }
                
                viewModel.checkWin()
                
                if viewModel.standsInStar() {
                    viewModel.tartaruga.estrelas += 1
                }
                
                try? await Task.sleep(for: .seconds(1))
            }
        }
    }
}

struct Buttons: View {
    
    @Binding var viewModel: TartarugaViewModel
    @Binding var Moves: [Move]
    
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.moveOptions, id: \.self) { move in
                Button(action: {
                    Moves.append(move)
                }, label: {
                    Image(systemName: move.systemName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55,height: 55)
                })
                .frame(width: 100, height: 100)
                .background {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.4))
                        .border(Color.gray)
                }
            }
        }
        .padding(.leading)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Historic: View {
    
    @Binding var Moves: [Move]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 2){
                ForEach(Moves, id: \.self) { move in
                    Image(systemName: move.systemName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55,height: 55)
                }
                .frame(width: 75, height: 75)
                .background {
                    Rectangle()
                        .foregroundStyle(.white.opacity(0.4))
                        .border(Color.gray)
                }
            }
        }
        .fixedSize(horizontal: false, vertical: true)
        .frame(width: 770)
        .padding(.bottom, 50)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

struct ButtonRestart: View {
    
    @Binding var viewModel: TartarugaViewModel
    @Binding var Moves: [Move]
    
    var body: some View {
        Button(action: {
            
            viewModel.reset()
            Moves.removeAll()
            
        }, label: {
            Image(systemName: "repeat.circle.fill")
                .foregroundStyle(.tint)
                .font(.system(size: 60))
        })
        .padding(50)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
    }
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Parabéns você completou a fase 1") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}



#Preview {
    NavigationStack{
        Fase(viewModel: .constant(TartarugaViewModel(name: "Fase 1", grid: 5, moveOptions: [.left, .right], stars: [2,3,4], yellowColor: [2, 3, 5], greenCellPosition: 4)))
    }
}
