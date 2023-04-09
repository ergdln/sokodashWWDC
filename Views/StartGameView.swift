//
//  StartGameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

struct StartGameView: View{
    var body: some View{
        
        NavigationView{
            
            NavigationLink("Tela de niveis!", destination: LevelsView())
                .navigationBarBackButtonHidden(true)

        }
        
    }
}
