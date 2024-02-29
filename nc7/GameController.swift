//
//  GameController.swift
//  nc7
//
//  Created by Pedro Pessuto on 27/02/24.
//

import Foundation

@Observable class GameController {
    
    var board: [Int] = []
    var newBoard: [Int] = []
    var size: Int = 100
    
    func check(n: Int) {
        
        let middle: Int = self.board[n]
        
        // Em Cima
        let p00 = (n - self.size) % self.size == 0 || (n - self.size - 1) < 0 ? 0 : self.board[n - self.size - 1]
        let p01 = (n - self.size) < 0 ? 0 : self.board[n - self.size]
        let p02 = (n - self.size + 1) % self.size == 0 || (n - self.size + 1) < 0 ? 0 : self.board[n - self.size + 1]
        
        // Mesma Linha
        let p10 = n % self.size == 0 ? 0 : self.board[n - 1]
        let p12 = (n - self.size + 1) % self.size == 0 ? 0 : self.board[n + 1]
        
        // Linha De Baixo
        let p20 = (n + self.size) % self.size == 0 || (n + self.size) >= self.size * self.size ? 0 : self.board[n + self.size - 1]
        let p21 = (n + self.size) >= self.size * self.size ? 0 : self.board[n + self.size]
        let p22 = (n + self.size + 1) % self.size == 0 || (n + self.size) >= self.size * self.size ? 0 : self.board[n + self.size + 1]

 
//        print("\(p00) | \(p01) | \(p02) ")
//        print("\(p10) | \(middle) | \(p12) ")
//        print("\(p20) | \(p21) | \(p22) \n")
        
        let sum: Int =  p00 + p01 + p02 + p10 + p12 + p20 + p21 + p22

        if middle == 0 {
            if sum == 3 {
                self.newBoard.append(1)
            } else {
                self.newBoard.append(0)
            }
        }
        else {
            if sum < 2 || sum > 3 {
                self.newBoard.append(0)
            }
            else {
                self.newBoard.append(1)
            }
        }
        
    }
    
    func generateBoard(size: Int) {
        
        //        self.board = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        //        self.newBoard = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        
        for _ in 0..<size*size {
            self.board.append(Int.random(in: 0...1))
            self.newBoard.append(Int.random(in: 0...1))
        }
        
        
    }
    
    func play() {
        
        //        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
        //
        //        }
        self.newBoard = []
        
        for i in 0..<size*size {
            self.check(n: i)
        }
        
        self.board = self.newBoard
    }
    
    
    
    init() {
        generateBoard(size: self.size)
    }
    
    
}
