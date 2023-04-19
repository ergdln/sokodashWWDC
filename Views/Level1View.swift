//
//  GameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import Foundation
import SwiftUI


struct Level1View: View{
    @State private var isGameOver = false
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
    @State var levelListOfTiles: [String] = Level1().level1Map
    let levelColumns = Level1().level1Grid
    @State var startPosition: Int = Level1().level1StartPosition
    let levelOffset = Level1().level1Offset
    let spotsIndex: [Int] = Level1().level1SpotsIndex
    
    
    @State var endGameText: String = "voce ainda nao venceu"
    
    
    
    var body: some View{
        ZStack{
            Image("BACKGROUND")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
            
            VStack(alignment: .center, spacing: 10){
                ZStack{
                    Button(action:{
                        levelListOfTiles = Level1().level1Map
                        startPosition = 70
                    }){
                       Image("REFRESH")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50)
                    }.frame(width: 500, alignment: .trailing)
                        .disabled(isGameOver)
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
                        }
                    }.disabled(isGameOver)
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
            
            if isGameOver{
                ZStack{
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                        .background(.black)
                        .opacity(0.5)
                    NavigationLink(destination: Level3View()) {
                        Text("Level3")
                    }.navigationBarBackButtonHidden(true)
                }
            }
        }
    }
}

extension Level1View{
    
    
    
    
    
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
            self.isGameOver.toggle()
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









