//
//  LevelsView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

struct LevelsView: View{
    var body: some View{
        
        NavigationView{
            
            NavigationLink("Tela de jogo", destination: GameView())
                .navigationBarBackButtonHidden(true)
        }
        
    }
}
