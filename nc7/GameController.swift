//
//  GameController.swift
//  nc7
//
//  Created by Pedro Pessuto on 27/02/24.
//

import Foundation

@Observable class GameController {
    
    var board: [[Int]] = []
    var newBoard: [[Int]] = []
    var steps: Int = 0
    
    func check(x: Int, y: Int) {
        steps = steps + 1
        
        let middle: Int = self.board[x][y]
        let row: Int = board.count
        let col: Int = board[0].count
        
        // Em Cima
        let p00 = self.board[(x - 1 + row) % row][(y - 1 + col) % col]
        let p01 = self.board[(x - 1 + row) % row][(y + col) % col]
        let p02 = self.board[(x - 1 + row) % row][(y + 1 + col) % col]
        
        // Mesma Linha
        let p10 = self.board[(x + row) % row][(y - 1 + col) % col]
        let p12 = self.board[(x + row) % row][(y + 1 + col) % col]
        
        // Linha De Baixo
        let p20 = self.board[(x + 1 + row) % row][(y - 1 + col) % col]
        let p21 = self.board[(x + 1 + row) % row][(y + col) % col]
        let p22 = self.board[(x + 1 + row) % row][(y + 1 + col) % col]
        
//        print("\(p00) | \(p01) | \(p02) ")
//        print("\(p10) | \(self.board[x][y]) | \(p12) ")
//        print("\(p20) | \(p21) | \(p22) ")
        
        let sum: Int =  p00 + p01 + p02 + p10 + p12 + p20 + p21 + p22
        
        if middle == 0 {
            if sum == 3 {
                newBoard[x][y] = 1
            }
        }
        else {
            if sum < 2 || sum > 3 {
                newBoard[x][y] = 0
            }
        }
        
    }
    
    func generateBoard(size: Int) {
        
        for _ in 0..<size {
            var aux: [Int] = []
            for _ in 0..<size {
                aux.append(Int.random(in: 0...1))
            }
            self.board.append(aux)
            self.newBoard.append(aux)
        }
        
        
    }
    
    func play() {
        
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            
//        }
        
        steps = 0
        for coluna in 0..<self.board.count {
            for linha in 0..<self.board[coluna].count {
                self.check(x: linha, y: coluna)
            }
        }
        self.board = self.newBoard
        print(steps)
        
    }
    
    
    
    init() {
        generateBoard(size: 100)
    }
    
    
}
