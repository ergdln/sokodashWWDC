//
//  GameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import Foundation
import SwiftUI


struct Level2View: View{
    @Environment(\.dismiss) var dismiss
    
    //witch first image
    @State var witchImage: String = "WITCH-LEFT"
    
    
    //Rename de map elements
    let box: String = "📦"
    let grass: String = "⬜️"
    let person: String = "🙋🏿"
    let wall: String = "⬛️"
    let spot: String = "🟨"
    let empty: String = "🟫"
    
    
    //level information
    @State var levelListOfTiles: [String] = Level2().level2Map
    let levelColumns = Level2().level2Grid
    @State var startPosition: Int = Level2().level2StartPosition
    let levelOffset = Level2().level2Offset
    let spotsIndex = Level2().level2SpotsIndex
    
    
    @State var endGameText: String = "voce ainda nao venceu"
    
    
    var body: some View{
        ZStack{
            Image("BACKGROUND")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
            
            VStack(alignment: .center, spacing: 10){
                ZStack{
                    Button("< Return"){
                        dismiss()
                    }.frame(width: 500, alignment: .leading)
                    
                    Button("Refresh"){
                        levelListOfTiles = Level2().level2Map
                        startPosition = 5
                    }.frame(width: 500, alignment: .trailing)
                }
                Spacer()
                LazyVGrid(columns: levelColumns, spacing: 0){
                    ForEach((0...levelListOfTiles.count-1), id: \.self) { num in
                        if levelListOfTiles[num] == wall{
                            Image("BRICK")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == grass{
                            Image("GRASS")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == spot{
                            Image("SPOT")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == box{
                            Image("CAULDRON")
                                .resizable()
                                .scaledToFill()
                        }
                        else if levelListOfTiles[num] == person{
                            Image(witchImage)
                                .resizable()
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
                    Button(action:{
                        witchImage = "WITCH-LEFT"
                        defineMoviment(actualPosition: startPosition, offset: -1)
                    }){
                        Image("LEFT")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
                    
                    
                    VStack{
                        Button(action:{
                            defineMoviment(actualPosition: startPosition, offset: levelOffset * -1)
                        }){
                            Image("UP")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            
                        }
                        Button(action:{
                            defineMoviment(actualPosition: startPosition, offset: levelOffset)
                        }){
                            Image("DOWN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                        }
                    }
                    Button(action:{
                        witchImage = "WITCH-RIGHT"
                        defineMoviment(actualPosition: startPosition, offset: 1)
                    }){
                        Image("RIGHT")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }
                }.frame(width: 500)
            }.frame(width: 600, height: 600)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

extension Level2View{
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









