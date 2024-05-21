//
//  TartarugaViewModel.swift
//  CodeKid's
//
//  Created by found on 14/05/24.
//

import Foundation

@Observable
class TartarugaViewModel: Identifiable {
    
    let id: UUID = UUID()
    
    var name: String
    
    var tartaruga = Tartaruga(picture: "tartaruga", estrelas: 0)
    
    var stars: [Int]
    
    init(name: String, stars: [Int]) {
        self.name = name
        self.stars = stars
    }
    
    /*
     5  [1,0]   [5/5, 5%5]
     6  [1,1]   [6/5, 6%5]
     7  [1,2]   [7/5, 7%5]
     */
    func standsInStar(gridColumns: Int = 5) -> Bool {
        for (index, star) in stars.enumerated() {
            let lineStar = Int(star / gridColumns)
            let columnStar = Int(star % gridColumns)
            if columnStar == tartaruga.x, lineStar == tartaruga.y { // colisão!
                stars.remove(at: index)
                return true
            }
        }
        return false
    }
}

/*
 
↑
y
 x ->
 
   0 1 2 3
 0 a b c d
 1 e f g h
 2 i j k l
 
 
 */
