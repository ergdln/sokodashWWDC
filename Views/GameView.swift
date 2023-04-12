//
//  GameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import Foundation
import SwiftUI

struct GameView: View{
    
    //Rename de map elements
    let box: String = "📦"
    let grass: String = "⬜️"
    let person: String = "🙋🏿"
    let wall: String = "⬛️"
    let spot: String = "🟨"
    let empty: String = "🟫"
    
  
    @State var levelListOfTiles: [String] = Level3().level3Map
    let levelColumns = Level3().level3Grid
    @State var startPosition: Int = Level3().level3StartPosition
    let levelOffset = Level3().level3Offset
    let spotsIndex = Level3().level3SpotsIndex
    
    
    @State var endGameText: String = "voce ainda nao venceu"

    
    var body: some View{
        
        
        ZStack{
            Image("sokobg")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            VStack(alignment: .center, spacing: 10){
                ZStack{
                    Button("< Return"){
                        levelListOfTiles = Level3().level3Map
                        startPosition = 69
                    }.frame(width: 500, alignment: .leading)
                    
                    Button("Refresh"){
                        levelListOfTiles = Level3().level3Map
                        startPosition = 69
                    }.frame(width: 500, alignment: .trailing)
                }
                Spacer()
                LazyVGrid(columns: levelColumns, spacing: 0){
                    ForEach((0...levelListOfTiles.count-1), id: \.self) { num in
                        
                        if levelListOfTiles[num] == wall{
                            Image("Brick")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == grass{
                            Image("GRASS")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == spot{
                            Circle().foregroundColor(.yellow)
                                .scaledToFill()
                            
                        }
                        else if levelListOfTiles[num] == box{
                            Circle().foregroundColor(.blue)
                                .scaledToFill()
                            
                        }
                        else if levelListOfTiles[num] == person{
                            Circle().foregroundColor(.red)
                                .scaledToFill()
 
                        }
                        else if levelListOfTiles[num] == empty{
                            Image("empty")
                                .resizable()
                                .scaledToFill()
 
                        }
                    }
                }
                
                //MARK: game controls
                HStack{
                    Button("⬅️"){
                        defineMoviment(actualPosition: startPosition, offset: -1)
                    }
                    
                    
                    VStack{
                        Button("⬆️"){
                            defineMoviment(actualPosition: startPosition, offset: levelOffset * -1)
                        }
                        
                        Button("⬇️"){
                            defineMoviment(actualPosition: startPosition, offset: levelOffset)
                        }
                    }
                    
                    Button("➡️"){
                        defineMoviment(actualPosition: startPosition, offset: 1)
                       
                    }
                    
                    Text(endGameText)
                    
                   
                }.frame(width: 500)
                
            }.frame(width: 600, height: 600)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())

        }
    }
}

extension GameView{
    
    //MARK: Game Functions
    
    func defineMoviment(actualPosition: Int, offset: Int){
        //walking in free space recursively
        if levelListOfTiles[actualPosition + offset] == grass {
            levelListOfTiles.swapAt(actualPosition + offset, actualPosition)
            startPosition = actualPosition + offset
            //recursion
            if (levelListOfTiles[startPosition + offset] == box) || (levelListOfTiles[startPosition + offset] == wall) {
                //while walking you hit something, so it's time to stop walking
            }
            else{
                //keep moving
                defineMoviment(actualPosition: startPosition, offset: offset)
            }
        }
        //pushing a box
        else if levelListOfTiles[startPosition + offset] == box {
            if levelListOfTiles[actualPosition + offset + offset] != wall && levelListOfTiles[actualPosition + offset + offset] != box{
                levelListOfTiles[actualPosition] = grass
                levelListOfTiles[actualPosition + offset] = person
                levelListOfTiles[actualPosition + offset + offset] = box
                startPosition = actualPosition + offset
            }
        }
        else{
            //moving agains a wall or plate
            //stop walking
        }
        //checking if the level is done
        if isLevelCompleted(platesPosition: spotsIndex){
            print("venceuuuuuu")
        }
    }
    
    //MARK: function that checks if the level is completed
    func isLevelCompleted(platesPosition: [Int]) -> Bool{
        if (platesPosition.allSatisfy{levelListOfTiles[$0] == box}){
            endGameText = "voce venceu"
            return true
        }
        else{
            return false
        }
    }
}


    
    





