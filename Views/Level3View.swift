//
//  GameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import Foundation
import SwiftUI


struct Level3View: View{
    
    //MARK: VARIABLES
    @State private var isGameOver = false
    @Environment(\.dismiss) var dismiss
    
    //witch's first image
    @State var witchImage: String = "WITCH-LEFT"
    
    
    //Rename de map elements
    let box: String = "📦"
    let grass: String = "⬜️"
    let person: String = "🙋🏿"
    let wall: String = "⬛️"
    let spot: String = "🟨"
    let empty: String = "🟫"
    
    
    //level information
    @State var levelListOfTiles: [String] = Level3().level3Map
    let levelColumns = Level3().level3Grid
    @State var startPosition: Int = Level3().level3StartPosition
    let levelOffset = Level3().level3Offset
    let spotsIndex = Level3().level3SpotsIndex
    
    
    
    //MARK: THE GAME VIEW
    var body: some View{
        ZStack{
            Image("BACKGROUND")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
            
            VStack(alignment: .center, spacing: 10){
                ZStack{
                    Button(action:{
                        levelListOfTiles = Level3().level3Map
                        startPosition = Level3().level3StartPosition
                    }){
                       Image("REFRESH")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50)
                    }.frame(width: 500, alignment: .trailing)
                        .disabled(isGameOver)
                }
                Spacer()
                
                //MARK: GAME GRID
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
                    }.disabled(isGameOver)
                    
                    
                    VStack{
                        Button(action:{
                            defineMoviment(actualPosition: startPosition, offset: levelOffset * -1)
                        }){
                            Image("UP")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            
                        }.disabled(isGameOver)
                        Button(action:{
                            defineMoviment(actualPosition: startPosition, offset: levelOffset)
                        }){
                            Image("DOWN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                        }.disabled(isGameOver)
                    }
                    Button(action:{
                        witchImage = "WITCH-RIGHT"
                        defineMoviment(actualPosition: startPosition, offset: 1)
                    }){
                        Image("RIGHT")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                    }.disabled(isGameOver)
                }.frame(width: 500)
            }.frame(width: 600, height: 600)
                .navigationBarBackButtonHidden(true)
                .navigationViewStyle(StackNavigationViewStyle())
            
            //MARK: Changes the screen when the game is over
            if isGameOver{
                ZStack{
                    NavigationView{
                        ZStack{
                            Image("BACKGROUND")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                            
                            VStack{
                                Image("L3COMPLETED")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 700, height: 700)
                                
                                NavigationLink(destination: FinalView()){
                                    Image("OK")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 100, height: 50)
                                }.frame(width:500, alignment: .trailing)
                            }
                        }.navigationBarBackButtonHidden(true)
                    }.navigationViewStyle(StackNavigationViewStyle())
                }
            }
        }
    }
}

extension Level3View{
    
    
    
    
    
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
            self.isGameOver.toggle()        }
    }
    
    //MARK: function that checks if the level is completed
    func isLevelCompleted(platesPosition: [Int]) -> Bool{
        if (platesPosition.allSatisfy{levelListOfTiles[$0] == box}){
            return true
        }
        else{
            return false
        }
    }
}









