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

                ForEach(gameController.board.indices, id: \.self) { x in
                    HStack (spacing: 0) {
                        ForEach(gameController.board[x].indices, id: \.self) { y in
                            VStack {
                                Text("\(gameController.board[x][y])")
                                    .foregroundStyle(gameController.board[x][y] == 1 ? .black : .white)
                                
                            }
                            .frame(width: 50, height: 50)
                            .border(.black)
                            .background(gameController.board[x][y] == 1 ? .white : .black)
                            .onTapGesture {
                                print(gameController.board[x][y])
                                if gameController.board[x][y] == 1 {
                                    gameController.board[x][y] = 0
                                    gameController.newBoard[x][y] = 0
                                }
                                
                                else {
                                    gameController.board[x][y] = 1
                                    gameController.newBoard[x][y] = 1
                                }
                                print(gameController.board[x][y])
                            }
                        }
                    }
                }
            
            }
            
            Button(action: {gameController.play()}) {
                Text("play")
            }
            .padding(.top)
        }
        .environment(gameController)
    }
}

#Preview {
    ContentView()
}
