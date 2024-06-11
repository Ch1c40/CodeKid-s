//
//  TartarugaViewModel.swift
//  CodeKid's
//
//  Created by found on 14/05/24.
//

import Foundation
import Observation

@Observable
class TartarugaViewModel: Identifiable {
    
    let id: Int
    
    var name: String
    
    let grid: Int
    
    var moveOptions: [Move] = [.right, .left, .up, .down]
    
    var tartaruga = Tartaruga(picture: "tartaruga", estrelas: 0)
    
    var obstaculos: [Obstaculo]
    
    var initialStars: [Int]
    
    var stars: [Int]
    
    var greenCellPosition: Int
    
    var yellowColor: [Int]
    
    var task: Task<Void, Never>?
    
    var win: Bool = false
    
    
    init(
        id: Int,
        name: String,
        grid: Int,
        moveOptions: [Move],
        stars: [Int],
        yellowColor: [Int] ,
        greenCellPosition: Int,
        obstaculo: [Obstaculo]
    ) {
        self.id = id
        self.name = name
        self.initialStars = stars
        self.grid = grid
        self.stars = stars
        self.greenCellPosition = greenCellPosition
        self.moveOptions = moveOptions
        self.yellowColor = yellowColor
        self.obstaculos = obstaculo
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
    func reset() {
        self.stars = initialStars
        self.tartaruga = Tartaruga(picture: "tartaruga", estrelas: 0)
        self.task?.cancel()
    }
    
    func checkWin() {
        let lineGreen = Int(greenCellPosition / 5) // 5 é o tamanho da linha (quantidade de grid item)
        let columnGreen = Int(greenCellPosition % 5)
        
        if tartaruga.x == columnGreen && tartaruga.y == lineGreen {
            win = true
        }
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
