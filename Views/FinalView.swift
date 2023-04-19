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
            
            Text("You did it!")
                .font(.system(size: 156))
                .foregroundColor(.white)
        }
    }
}

struct FinalView_Previews: PreviewProvider {
    static var previews: some View {
        FinalView()
    }
}
