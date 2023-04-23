//
//  FinalView.swift
//  sokoban
//
//  Created by egln on 18/04/23.
//

import SwiftUI

struct FinalView: View {
    var body: some View {
        ZStack{
            Image("BACKGROUND")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
            
            Image("SECRETOFTHEUNIVERSE")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 700, height: 700)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
