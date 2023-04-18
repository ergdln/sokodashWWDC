////
////  LevelViewModel.swift
////  sokoban
////
////  Created by egln on 07/04/23.
////
//
import SwiftUI

@MainActor class GameInfo: ObservableObject{
    
    //level information
    @Published var levelListOfTiles: [String] = [" "]
    @Published var levelColumns: [GridItem] = []
    @Published var startPosition: Int = 1
    @Published var levelOffset: Int = 0
    @Published var spotsIndex: [Int] = []
 
}
