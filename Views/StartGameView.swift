//
//  StartGameView.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI
import AVFoundation

struct StartGameView: View{
    
    @State var audioPlayer: AVAudioPlayer!
    @State var animatingI = false
    @State var animatingJ = true
    
    var body: some View{
        
        NavigationView{
            ZStack{
                Image("BACKGROUND")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                
                
                VStack{
                    ZStack{
                        
                        Group{
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -140
                                    }  else if animatingJ && animatingI {
                                        return -130
                                    } else {
                                        return -135
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -95
                                    }  else if animatingJ && animatingI {
                                        return -100
                                    } else {
                                        return -400
                                    }
                                }())
                                .animation(.easeInOut(duration: 3).repeatForever(), value: animatingJ)
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -115
                                    }  else if animatingJ && animatingI {
                                        return -130
                                    } else {
                                        return -400
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 200
                                    }  else if animatingJ && animatingI {
                                        return 160
                                    } else {
                                        return 170
                                    }
                                }())
                                .animation(.easeInOut(duration: 3).repeatForever(), value: animatingJ)
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(0.3))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 120
                                    }  else if animatingJ && animatingI {
                                        return 130
                                    } else {
                                        return 400
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 140
                                    }  else if animatingJ && animatingI {
                                        return 160
                                    } else {
                                        return -100
                                    }
                                }())
                                .animation(.easeInOut(duration: 3).repeatForever(), value: animatingJ)
                            
                            Image("WITCH-START")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 400, height: 400)
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 20
                                    }  else if animatingJ && animatingI {
                                        return -20
                                    } else {
                                        return 35
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 50
                                    }  else if animatingJ && animatingI {
                                        return 60
                                    } else {
                                        return 30
                                    }
                                }())
                                .animation(.easeInOut(duration: 3.5).repeatForever(), value: animatingJ)
                                .onAppear {
                                    animatingJ.toggle()
                                }
                                .onChange(of: animatingJ) { _ in
                                    animatingI.toggle()
                                    animatingJ.toggle()
                                    
                                }
                        }
                    }
                    
                    NavigationLink(destination: LevelsView()){
                        
                        VStack{
                            
                            Text("SOKODASH")
                            
                            Text("Put all the circles in the correct circle and then CIRCLE")
                            
                            NavigationLink(destination: LevelsView()){
                                Text("OLA")
                                
                            }.navigationBarBackButtonHidden(true)
                        }
                    }
                }.onAppear {
                    //                let sound = Bundle.main.path(forResource: "backMusic", ofType: "mp3")
                    //       //         self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    //                audioPlayer.play()
                    //                audioPlayer.numberOfLoops = -1
                }
                
            }
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}
