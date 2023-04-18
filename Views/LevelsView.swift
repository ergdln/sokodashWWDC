//
//  LevelsView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

struct LevelsView: View{
    var body: some View{
        @StateObject var data = GameInfo()
        
        
        NavigationView{
            ZStack{
                Image("BACKGROUND")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                VStack{
                    NavigationLink(destination: Level1View()) {
                        Text("Level1")
                    }
                    NavigationLink(destination: Level2View()) {
                        Text("Level2")
                    }
                    NavigationLink(destination: Level3View()) {
                        Text("Level3")
                    }
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

