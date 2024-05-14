//
//  Move.swift
//  CodeKid's
//
//  Created by found on 14/05/24.
//

import Foundation

enum Move: CaseIterable {
    
    case left
    case right
    case up
    case down
    
    var dx: Int {
        switch self {
        case .left:
            return -1
        case .right:
            return +1
        case .up:
            return 0
        case .down:
            return 0
        }
    }
    
    var dy: Int {
        switch self {
        case .left:
            return 0
        case .right:
            return 0
        case .up:
            return -1
        case .down:
            return +1
            
        }
    }
    
    var systemName: String {
        switch self {
        case .left:
            return "arrowshape.left.fill"
        case .right:
            return "arrowshape.right.fill"
        case .up:
            return "arrowshape.up.fill"
        case .down:
            return "arrowshape.down.fill"
        }
    }
    
    
}
