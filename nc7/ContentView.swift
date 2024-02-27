//
//  ContentView.swift
//  nc7
//
//  Created by Pedro Pessuto on 26/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var gameController: GameController = GameController()
    
    var body: some View {
        ZStack {
           
            VStack (spacing: 0) {
                ForEach(Array(gameController.board.enumerated()), id: \.element) { index, array in
                    HStack (spacing: 0) {
                        ForEach(array.indices, id: \.self) { value in
                            VStack {
                                Text("\(array[value])")
                                    .foregroundStyle(array[value] == 1 ? .black : .white)
                                
                            }
                            .frame(width: 50, height: 50)
                            .border(.black)
                            .background(array[value] == 1 ? .white : .black)
                            .onTapGesture {
                                print(value)
                                print(index)
//                              gameController.check(x: index, y: value)
                            }
                        }
                    }
                }
                
            }
//            VStack {
//                Button(action: {gameController.play()}) {
//                    Text("play")
//                }
//                Spacer()
//            }
            
            
        }
        .environment(gameController)
    }
}

#Preview {
    ContentView()
}

@Observable class GameController {
    
    var board: [[Int]] = []
    var newBoard: [[Int]] = []
    
    func check(x: Int, y: Int) {
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
        
        print("\(p00) | \(p01) | \(p02) ")
        print("\(p10) | \(self.board[x][y]) | \(p12) ")
        print("\(p20) | \(p21) | \(p22) ")
        
        let soma: Int =  p00 + p01 + p02 + p10 + p12 + p20 + p21 + p22
        
        if middle == 0 {
            
            if soma == 3 {
                newBoard[x][y] = 1
            }
        }
        else {
            
            if soma < 2 || soma > 3 {
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
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            for coluna in 0..<self.board.count {
                for linha in 0..<self.board[coluna].count {
                    self.check(x: linha, y: coluna)
                }
            }
            self.board = self.newBoard
        }
        
        
    }
    
    
    
    init() {
        generateBoard(size: 5)
    }
    
    
}
