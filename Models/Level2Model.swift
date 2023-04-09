//
//  Level2Model.swift
//  sokoban
//
//  Created by egln on 09/04/23.
//

import SwiftUI

class Level2{
    
    let level2StartPosition: Int = 13
    let upDownOffset: Int = 5
    
    let level2Grid = [
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),
        GridItem(.flexible(minimum: 30, maximum: 150), spacing: 0),

    ]
    
    let level2Map: [String] = [
        
        // ⬛️ = wall, 📦 = box,  🙋🏿 = person,  ⬜️ = grass,   🟨 = plate.
        
        "⬛️", "⬛️", "⬛️", "⬛️", "⬛️",        //00 //01 //02 //03 //04
        "⬛️", "🟨", "📦", "⬜️", "⬛️",        //05 //06 //07 //08 //09
        "⬛️", "⬜️", "⬜️", "🙋🏿", "⬛️",        //10 //11 //12 //13 //14
        "⬛️", "⬛️", "⬛️", "📦", "⬛️",        //15 //16 //17 //18 //19
        "⬛️", "⬛️", "⬛️", "🟨", "⬛️",        //20 //21 //22 //23 //24
        "⬛️", "⬜️", "⬜️", "⬜️", "⬛️",        //25 //26 //27 //28 //29
        "⬛️", "⬜️", "⬜️", "⬜️", "⬛️",        //30 //31 //32 //33 //34
        "⬛️", "🟨", "⬜️", "📦", "⬛️",        //35 //36 //37 //38 //39
        "⬛️", "⬛️", "⬜️", "⬜️", "⬛️",        //40 //41 //42 //43 //44
        "⬛️", "⬛️", "⬛️", "⬛️", "⬛️",        //45 //46 //47 //48 //49
        
    ]
    
    
    
    
}
