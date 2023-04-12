//
//  SwiftUIView.swift
//  sokoban
//
//  Created by egln on 10/04/23.
//

import SwiftUI

struct WinningView: View {
    var body: some View {
        ZStack {
            
            NavigationView(){
                ZStack {
                    Rectangle()
                        .edgesIgnoringSafeArea(.all)
                        .opacity(0.3)
                    
                    Image("congrats")
                        .offset(y:-50)
                    Text("Vocês salvaram o mundo em:")
                        .multilineTextAlignment(.center)
                        .offset(y:-60)
                        .font(.system(size: 24))
                    //   .fontWeight(.semibold)
                        .frame(width: 171)
                    Text("seg")
                        .offset(y: 20)
                        .font(.largeTitle)
                    // .fontWeight(.semibold)
                        .foregroundColor(.black)
                    
                    NavigationLink (destination: LevelsView(), label: {
                        Image("buttonHome")
                    })  .simultaneousGesture(TapGesture().onEnded{
                        let sound = Bundle.main.path(forResource: "clickSound", ofType: "wav")
                        //                        self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                        //                        audioPlayer2.play()
                    })
                    .offset(x: 0, y: 124)
                    
                    
                    //                    Button(action: {
                    //                        let sound = Bundle.main.path(forResource: "clickSound", ofType: "wav")
                    //                        self.audioPlayer2 = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    //                        audioPlayer2.play()
                    //
                    //                        // colocar uma navigation link
                    //                    }) {
                    //                        Image("buttonReload")
                    //
                    //                    }.offset(x: 80, y: 124)
                    
                    
                }.onAppear {
                    let sound = Bundle.main.path(forResource: "congratsSound", ofType: "wav")
                    //                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    //                    audioPlayer.play()
                }.navigationBarBackButtonHidden(true)
                
                //}.navigationBarBackButtonHidden(true)
            }.navigationBarBackButtonHidden(true)
        }
        
//        func playSound() {
//            let sound = Bundle.main.path(forResource: "congratsSound", ofType: "wav")
//            //        self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
//            //        audioPlayer.play()
        }
    }

    
    struct SwiftUIView_Previews: PreviewProvider {
        static var previews: some View {
            WinningView()
        }
    }

