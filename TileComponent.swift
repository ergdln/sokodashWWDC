//
//  TileComponent.swift
//  sokoban
//
//  Created by egln on 07/04/23.
//

import SwiftUI


struct SavedRoomsCardComponent: View {
    
    var cardColor: String
    
    var body: some View {
                Text("x")
                    .font(.system(size: 10))
                   // .multilineTextAlignment(.center)
                    .frame(width: 50, height: 50)
                    .background(Color(cardColor))
            }
        }


