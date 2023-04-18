//
//  Level1Model.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

class Level1{
    
    //where the person starts in this level
    let level1StartPosition = 70
    let level1Offset: Int = 8
    let level1SpotsIndex: [Int] = [9, 35, 46, 57]
    
    //number of columns
    let level1Grid = [
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
    ]
    
    let level1Map: [String] = [
        
        // ⬛️ = wall, 📦 = box,  🙋🏿 = person,  ⬜️ = grass,   🟨 = plate.
        
        "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️",        //00 //01 //02 //03 //04 //05 //06 //07
        "⬛️", "🟨", "📦", "⬜️", "⬜️", "⬜️", "⬛️", "⬛️",        //08 //09 //10 //11 //12 //13 //14 //15
        "⬛️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬜️", "⬛️",        //16 //17 //18 //19 //20 //21 //22 //23
        "⬛️", "⬛️", "⬛️", "📦", "⬜️", "⬜️", "⬜️", "⬛️",        //24 //25 //26 //27 //28 //29 //30 //31
        "⬛️", "⬛️", "⬛️", "🟨", "⬜️", "⬜️", "📦", "⬛️",        //32 //33 //34 //35 //36 //37 //38 //39
        "⬛️", "⬜️", "⬜️", "⬛️", "⬜️", "⬜️", "🟨", "⬛️",        //40 //41 //42 //43 //44 //45 //46 //47
        "⬛️", "⬜️", "⬜️", "⬛️", "⬜️", "⬜️", "⬛️", "⬛️",        //48 //49 //50 //51 //52 //53 //54 //55
        "⬛️", "🟨", "⬜️", "📦", "⬜️", "⬜️", "⬜️", "⬛️",        //56 //57 //58 //59 //60 //61 //62 //63
        "⬛️", "⬛️", "⬜️", "⬜️", "⬜️", "⬜️", "🙋🏿", "⬛️",        //64 //65 //66 //67 //68 //69 //70 //71
        "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️", "⬛️"         //72 //73 //74 //75 //76 //77 //78 //79
        
    ]
}
