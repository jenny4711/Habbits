//
//  ScrollViewOffsetPref.swift
//  Habbits
//
//  Created by Ji y LEE on 7/2/25.
//

import Foundation
import SwiftUI
//scrollview offset preferenceKey
struct ScrollViewOffsetPref:PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value:inout CGFloat, nextValue:() -> CGFloat){
        value = nextValue()
    }
}
