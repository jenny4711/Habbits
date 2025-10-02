//
//  Spinner.swift
//  Habbits
//
//  Created by Ji y LEE on 7/1/25.
//

import SwiftUI

struct Spinner: View {
   
    @State private var rotation:Double = 0
    @State private var inAnimatedTriggered:Bool = false
    
    
    var body: some View {
        VStack {
                   
            ProgressView()
                        .progressViewStyle(CircularProgressViewStyle()) // 기본 스피너 스타일
//                        .scaleEffect(1.0)
                }
    }
}

#Preview {
    Spinner()
}
