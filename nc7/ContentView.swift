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
                
                ForEach(gameController.board.indices, id: \.self) {
                    x in
                    
                    if x % gameController.size == 0 {
                        HStack (spacing: 0) {
                            
                            ForEach(0..<gameController.size) { c in
                                VStack {
                                    Text("\(gameController.board[x + c])")
                                }
                                .foregroundStyle(gameController.board[x + c] == 0 ? .black : .white)
                                .frame(width: 50, height: 50)
                                .background(gameController.board[x + c] == 1 ? .black : .white)
                                
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
