//
//  ColorSlider.swift
//  Rang
//
//  Created by JD Patel on 14/11/19.
//  Copyright © 2019 JD. All rights reserved.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        
        HStack {
            Text("0")
              .foregroundColor(textColor)
            Slider(value: $value).accentColor(textColor)
            Text("255")
              .foregroundColor(textColor)
        }
//        .padding(8)
        
    }
}
