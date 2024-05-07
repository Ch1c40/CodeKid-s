//
//  Fase1.swift
//  CodeKid's
//
//  Created by found on 03/05/24.
//

import SwiftUI


struct Fase1: View {
    
    var body: some View {
        ZStack{
            Image("Background1")
                .blur(radius: 5.0)
                .ignoresSafeArea()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            
            VStack {
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(100), spacing: 5), count: 5), spacing: 5) {
                    ForEach(0..<25) { _ in
                        Rectangle()
                            .frame(width: 100, height: 100)
                            .foregroundStyle(.secondary)
                            .border(Color.black)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HStack {
                LazyHGrid(rows: Array(repeating: GridItem(.fixed(75), spacing: 2), count: 5), content: {
                    ForEach(0..<5){ _ in
                        Rectangle()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.white.opacity(0.4))
                            .border(Color.gray)
                    }
                })
                .padding()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack{
                LazyVGrid(columns: Array(repeating: GridItem(.fixed(75), spacing: 1), count: 10), content: {
                    ForEach(0..<10){ _ in
                        Rectangle()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.white.opacity(0.4))
                            .border(Color.gray)
                    }
                })
                .padding([.bottom], 50)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

#Preview {
    NavigationStack{
        Fase1()
    }
}
