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
                ZStack{
                    Image("sokobg")
                        .resizable()
                        .edgesIgnoringSafeArea(.all)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                NavigationLink("Tela de jogo", destination: GameView())
            }
            
        }.navigationBarBackButtonHidden(true)
        .navigationViewStyle(StackNavigationViewStyle())    }
}
