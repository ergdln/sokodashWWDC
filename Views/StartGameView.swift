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
                    .opacity(0.8)
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
                                        return 3440
                                    }  else if animatingJ && animatingI {
                                        return -2330
                                    } else {
                                        return -535
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -145
                                    }  else if animatingJ && animatingI {
                                        return -300
                                    } else {
                                        return 200
                                    }
                                }())
                                .animation(.easeInOut(duration: 3).repeatForever(), value: animatingJ)
                            
                            Image("SPOT-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 2430
                                    }  else if animatingJ && animatingI {
                                        return -2330
                                    } else {
                                        return -135
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -95
                                    }  else if animatingJ && animatingI {
                                        return 340
                                    } else {
                                        return 10
                                    }
                                }())
                                .animation(.easeInOut(duration: 5).repeatForever(), value: animatingJ)
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -240
                                    }  else if animatingJ && animatingI {
                                        return 430
                                    } else {
                                        return -2635
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -925
                                    }  else if animatingJ && animatingI {
                                        return -1300
                                    } else {
                                        return -200
                                    }
                                }())
                                .animation(.easeInOut(duration: 8).repeatForever(), value: animatingJ)
                           
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -1340
                                    }  else if animatingJ && animatingI {
                                        return -130
                                    } else {
                                        return -1335
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -1195
                                    }  else if animatingJ && animatingI {
                                        return -100
                                    } else {
                                        return -400
                                    }
                                }())
                                .animation(.easeInOut(duration: 7).repeatForever(), value: animatingJ)
                            
                            Image("SPOT-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(0.3))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 120
                                    }  else if animatingJ && animatingI {
                                        return 1330
                                    } else {
                                        return 1400
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
                                .animation(.easeInOut(duration: 2).repeatForever(), value: animatingJ)
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(0.3))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 4520
                                    }  else if animatingJ && animatingI {
                                        return 230
                                    } else {
                                        return -200
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 440
                                    }  else if animatingJ && animatingI {
                                        return 1260
                                    } else {
                                        return 400
                                    }
                                }())
                                .animation(.easeInOut(duration: 2).repeatForever(), value: animatingJ)
                            
                            
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(0.3))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 720
                                    }  else if animatingJ && animatingI {
                                        return -330
                                    } else {
                                        return 400
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -1440
                                    }  else if animatingJ && animatingI {
                                        return 160
                                    } else {
                                        return 400
                                    }
                                }())
                                .animation(.easeInOut(duration: 5).repeatForever(), value: animatingJ)
                           
                            Image("SPOT-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 1240
                                    }  else if animatingJ && animatingI {
                                        return -430
                                    } else {
                                        return 135
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 135
                                    }  else if animatingJ && animatingI {
                                        return 100
                                    } else {
                                        return -2300
                                    }
                                }())
                                .animation(.easeInOut(duration: 5).repeatForever(), value: animatingJ)
                           
                            
                        }
                        
                        //MARK: DANCING ELEMENTS
                        Group{
                            
                            Image("SPOT-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -440
                                    }  else if animatingJ && animatingI {
                                        return -2330
                                    } else {
                                        return -535
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -145
                                    }  else if animatingJ && animatingI {
                                        return -300
                                    } else {
                                        return 200
                                    }
                                }())
                                .animation(.easeInOut(duration: 5).repeatForever(), value: animatingJ)
                            
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
                                        return -335
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -95
                                    }  else if animatingJ && animatingI {
                                        return -100
                                    } else {
                                        return 1200
                                    }
                                }())
                                .animation(.easeInOut(duration: 2).repeatForever(), value: animatingJ)
                            
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
                                        return -335
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -95
                                    }  else if animatingJ && animatingI {
                                        return -100
                                    } else {
                                        return 1200
                                    }
                                }())
                                .animation(.easeInOut(duration: 9).repeatForever(), value: animatingJ)
                           
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return -1340
                                    }  else if animatingJ && animatingI {
                                        return -130
                                    } else {
                                        return -135
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return -1195
                                    }  else if animatingJ && animatingI {
                                        return -100
                                    } else {
                                        return -400
                                    }
                                }())
                                .animation(.easeInOut(duration: 6).repeatForever(), value: animatingJ)
                            
                            Image("SPOT-CLEAN")
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
                                        return 1400
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
                                .animation(.easeInOut(duration: 1).repeatForever(), value: animatingJ)
                            
                            Image("CAULDRON-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(0.3))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 420
                                    }  else if animatingJ && animatingI {
                                        return 230
                                    } else {
                                        return -200
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 440
                                    }  else if animatingJ && animatingI {
                                        return 1260
                                    } else {
                                        return 400
                                    }
                                }())
                                .animation(.easeInOut(duration: 7).repeatForever(), value: animatingJ)
                            

                           
                            Image("SPOT-CLEAN")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .rotationEffect(.radians(-0.2))
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 1240
                                    }  else if animatingJ && animatingI {
                                        return -430
                                    } else {
                                        return 135
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 135
                                    }  else if animatingJ && animatingI {
                                        return 100
                                    } else {
                                        return 200
                                    }
                                }())
                                .animation(.easeInOut(duration: 2).repeatForever(), value: animatingJ)
                           
                            Rectangle()
                                .opacity(0.6)
                                .frame(width: UIScreen.main.bounds.width * 1.5, height: UIScreen.main.bounds.height * 1.5)
                            
                            Image("MOON")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 600, height: 600)
                               
                                
                            
                            Image("WITCH-START")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 400, height: 400)
                                .offset(x: {
                                    if animatingJ && !animatingI {
                                        return 100
                                    }  else if animatingJ && animatingI {
                                        return -20
                                    } else {
                                        return -95
                                    }
                                }(),
                                        y: {
                                    if animatingJ && !animatingI {
                                        return 100
                                    }  else if animatingJ && animatingI {
                                        return 100
                                    } else {
                                        return 100
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
                    NavigationLink(destination: HelpView()){
                        VStack{
                            Text("Welcome to the Livia's puzzle!")
                                .font(.system(size: 46))
                                .foregroundColor(.purple)
                            Text("Tap to play!")
                                .font(.system(size: 36))
                                .foregroundColor(.white)
                        }
                        
                    }.navigationBarBackButtonHidden(true)
                }
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        
    }
}
