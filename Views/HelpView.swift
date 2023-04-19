//
//  HelpView.swift
//  sokoban
//
//  Created by egln on 18/04/23.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView{
            VStack(spacing: 0){
                ZStack{
                    Image("BACKGROUND")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .opacity(0.8)
                        .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                    VStack{
                        Image("HELP")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 700, height: 700)
                        
                        NavigationLink(destination: Level2View()){
                            Image("OK")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50)
                        }.frame(width:500, alignment: .trailing)
                    }
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
            .navigationBarBackButtonHidden(true)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
