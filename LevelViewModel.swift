//
//  LevelViewModel.swift
//  sokoban
//
//  Created by egln on 07/04/23.
//

import SwiftUI

// MARK: Variables to watch mark as Published. ViewModel also calls API/Core Data

final class Tiles: ObservableObject {
    
    
    @State var listOfTiles: [String] = [
        
        
        "b", "b", "b", "b", "b", "b", "b", "b",
        "b", "y", "w", "x", "x", "x", "b", "b",
        "b", "x", "x", "m", "x", "x", "x", "b",
        "b", "b", "b", "x", "x", "x", "x", "b",
        "b", "b", "b", "x", "x", "x", "x", "b",
        "b", "x", "x", "x", "x", "x", "x", "b",
        "b", "x", "x", "x", "x", "x", "b", "b",
        "b", "x", "x", "x", "x", "x", "b", "b",
        "b", "b", "x", "x", "x", "x", "x", "b",
        "b", "b", "b", "b", "b", "b", "b", "b"
        
        ]
    
}
