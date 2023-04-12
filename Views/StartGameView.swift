//
//  StartGameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

struct StartGameView: View{
    
    @State var animatingI = false
    @State var animatingJ = true
    
    var body: some View{
        
        NavigationView{
            NavigationLink(destination: LevelsView()){
                Text("OLA")
                VStack{
                    
                    Text("SOKODASH")
                    
                    Text("Put all the circles in the correct circle and then CIRCLE")
                    
                    NavigationLink(destination: LevelsView()){
                        Text("OLA")
                        
                    }.navigationBarBackButtonHidden(true) 
                }
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}
//                Image("sokobg")
//                    .resizable()
//                    .edgesIgnoringSafeArea(.all)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
//
//                Image("grama")
//                    .resizable()
//                    .scaledToFit()
//                // .aspectRatio(contentMode: .fill)
//                    .frame(width: 50, height: 50)
//                    .offset(x: {
//                        if animatingJ && !animatingI {
//                            return -100
//                        }  else if animatingJ && animatingI {
//                            return -10
//                        } else {
//                            return 100
//                        }
//                    }(),
//                            y: {
//                        if animatingJ && !animatingI {
//                            return 0
//                        }  else if animatingJ && animatingI {
//                            return 0
//                        } else {
//                            return 0
//                        }
//                    }())
//                    .animation(.easeInOut(duration: 1.5).repeatForever(), value: animatingJ)
//                    .onAppear {
//                        animatingJ.toggle()
//                    }
//                    .onChange(of: animatingJ) { _ in
//                        animatingI.toggle()
//                        animatingJ.toggle()
//
//                        Image("grama")
//                            .resizable()
//                            .scaledToFit()
//                        // .aspectRatio(contentMode: .fill)
//                            .frame(width: 50, height: 50)
//                            .offset(x: {
//                                if animatingJ && !animatingI {
//                                    return -100
//                                }  else if animatingJ && animatingI {
//                                    return -10
//                                } else {
//                                    return -100
//                                }
//                            }(),
//                                    y: {
//                                if animatingJ && !animatingI {
//                                    return 0
//                                }  else if animatingJ && animatingI {
//                                    return 0
//                                } else {
//                                    return -120
//                                }
//                            }())
//                            .animation(.easeInOut(duration: 1.5).repeatForever(), value: animatingJ)
//                            .onAppear {
//                                animatingJ.toggle()
//                            }
//                            .onChange(of: animatingJ) { _ in
//                                animatingI.toggle()
//                                animatingJ.toggle()
//
//
//
//
